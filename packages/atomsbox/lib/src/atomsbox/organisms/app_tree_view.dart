import 'package:flutter/material.dart';

import '../atoms/config/app_constants.dart';

/// Tree view with collapsible and expandable nodes.
///
/// Based on the flutter_simple_treeview package from Google
class AppTreeView extends StatefulWidget {
  AppTreeView({
    super.key,
    this.treeController,
    required List<AppTreeNode> nodes,
    this.indent = AppConstants.lg,
    this.iconSize,
  }) : nodes = copyTreeNodes(nodes);

  /// Tree controller to manage the tree state.
  final AppTreeController? treeController;

  /// List of root level tree nodes.
  final List<AppTreeNode> nodes;

  /// Horizontal indent between levels.
  final double? indent;

  /// Size of the icons.
  final double? iconSize;

  @override
  State<AppTreeView> createState() => _AppTreeViewState();
}

class _AppTreeViewState extends State<AppTreeView> {
  AppTreeController? _controller;

  @override
  void initState() {
    _controller = widget.treeController ?? AppTreeController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildNodes(
      widget.nodes,
      widget.indent,
      _controller!,
      widget.iconSize,
    );
  }
}

/// A controller for a tree state.
///
/// Allows to modify the state of the tree
/// (i.e. expand and collapse the nodes).
class AppTreeController {
  AppTreeController({
    allNodesExpanded = false,
  }) : _allNodesExpanded = allNodesExpanded;

  final bool _allNodesExpanded;

  final Map<Key, bool> _expanded = <Key, bool>{};

  bool get allNodesExpanded => _allNodesExpanded;

  bool isNodeExpanded(Key key) => _expanded[key] ?? _allNodesExpanded;

  void toggleNodeExpanded(Key key) => _expanded[key] = !isNodeExpanded(key);

  void expandNode(Key key) => _expanded[key] = true;

  void collapseNode(Key key) => _expanded[key] = false;
}

/// One node of a tree.
class AppTreeNode {
  AppTreeNode({
    this.key,
    this.onPressed,
    this.icon,
    Icon? expandedIcon,
    Widget? content,
    this.children,
  })  : content = content ?? const SizedBox(width: 0, height: 0),
        expandedIcon = expandedIcon ?? icon;

  final Key? key;
  final Widget content;
  final Icon? icon;
  final Icon? expandedIcon;
  final VoidCallback? onPressed;
  final List<AppTreeNode>? children;
}

/// Widget that displays one [AppTreeNode] and its children.
class AppTreeNodeWidget extends StatefulWidget {
  const AppTreeNodeWidget({
    super.key,
    required this.treeNode,
    required this.treeController,
    this.onPressed,
    this.indent,
    this.iconSize,
  });

  final AppTreeNode treeNode;
  final AppTreeController treeController;
  final double? indent;
  final double? iconSize;
  final VoidCallback? onPressed;

  @override
  State<AppTreeNodeWidget> createState() => _AppTreeNodeWidgetState();
}

class _AppTreeNodeWidgetState extends State<AppTreeNodeWidget> {
  bool get _isLeaf {
    return widget.treeNode.children == null ||
        widget.treeNode.children!.isEmpty;
  }

  bool get _isExpanded {
    return widget.treeController.isNodeExpanded(widget.treeNode.key!);
  }

  @override
  Widget build(BuildContext context) {
    var icon = _isLeaf
        ? null
        : _isExpanded
            ? Icons.expand_more
            : Icons.chevron_right;

    var onTap = _isLeaf
        ? (widget.onPressed != null)
            ? widget.onPressed
            : null
        : () {
            setState(() {
              widget.treeController.toggleNodeExpanded(widget.treeNode.key!);
            });

            if (widget.onPressed != null) widget.treeNode.onPressed!();
          };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          onTap: onTap,
          child: Row(
            children: [
              _isLeaf
                  ? const SizedBox(width: AppConstants.sm)
                  : Container(
                      margin: const EdgeInsets.only(right: AppConstants.sm),
                      child: Icon(
                        icon,
                        size: widget.iconSize,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
              _isLeaf
                  ? const SizedBox()
                  : Container(
                      margin: const EdgeInsets.only(right: AppConstants.sm),
                      child: _isExpanded
                          ? widget.treeNode.expandedIcon
                          : widget.treeNode.icon,
                    ),
              Container(
                constraints: BoxConstraints(
                  minHeight: widget.iconSize ?? 24,
                ),
                child: widget.treeNode.content,
              ),
            ],
          ),
        ),
        if (_isExpanded && !_isLeaf)
          Padding(
            padding: EdgeInsets.only(left: widget.indent!),
            child: buildNodes(
              widget.treeNode.children!,
              widget.indent,
              widget.treeController,
              widget.iconSize,
            ),
          )
      ],
    );
  }
}

class _AppTreeNodeKey extends ValueKey {
  const _AppTreeNodeKey(dynamic value) : super(value);
}

/// Provides unique keys and verifies duplicates.
class AppTreeNodeKeyProvider {
  int _nextIndex = 0;
  final Set<Key> _keys = <Key>{};

  /// If [originalKey] is null, generates new key, otherwise verifies the key
  /// was not met before.
  Key key(Key? originalKey) {
    if (originalKey == null) {
      return _AppTreeNodeKey(_nextIndex++);
    }
    if (_keys.contains(originalKey)) {
      throw ArgumentError('There should not be nodes with the same kays. '
          'Duplicate value found: $originalKey.');
    }
    _keys.add(originalKey);
    return originalKey;
  }
}

/// Builds set of [nodes] respecting [state], [indent] and [iconSize].
Widget buildNodes(
  Iterable<AppTreeNode> nodes,
  double? indent,
  AppTreeController treeController,
  double? iconSize,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      for (var node in nodes)
        AppTreeNodeWidget(
          treeNode: node,
          treeController: treeController,
          onPressed: node.onPressed,
          indent: indent,
          iconSize: iconSize,
        )
    ],
  );
}

/// Copies nodes to unmodifiable list, assigning missing keys and checking for duplicates.
List<AppTreeNode> copyTreeNodes(List<AppTreeNode>? nodes) {
  return _copyNodesRecursively(
    nodes,
    AppTreeNodeKeyProvider(),
  )!;
}

List<AppTreeNode>? _copyNodesRecursively(
  List<AppTreeNode>? nodes,
  AppTreeNodeKeyProvider keyProvider,
) {
  if (nodes == null) {
    return null;
  }

  return List.unmodifiable(nodes.map((n) {
    return AppTreeNode(
      key: keyProvider.key(n.key),
      icon: n.icon,
      expandedIcon: n.expandedIcon,
      onPressed: n.onPressed,
      content: n.content,
      children: _copyNodesRecursively(n.children, keyProvider),
    );
  }));
}
