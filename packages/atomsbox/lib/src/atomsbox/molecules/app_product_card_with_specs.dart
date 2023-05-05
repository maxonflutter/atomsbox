import 'package:flutter/material.dart';

import '../atoms/app_card.dart';
import '../atoms/app_filled_button.dart';
import '../atoms/app_label.dart';
import '../atoms/app_text.dart';
import '../atoms/config/app_constants.dart';

class AppProductCardWithSpecs extends StatefulWidget {
  const AppProductCardWithSpecs({
    super.key,
    this.id,
    this.sku,
    required this.name,
    required this.description,
    required this.price,
    this.category,
    this.currency = '\$',
    this.width,
    this.vat,
    this.specs = const [
      {'name': 'HEIGHT', 'description': '200cm'},
      {'name': 'WIDTH', 'description': '200cm'},
      {'name': 'WARRANTY', 'description': '2 years'},
    ],
    this.onPressedAddToCart,
    this.type = AppCardType.filled,
  });

  final String? id;
  final String? sku;
  final String name;
  final String description;
  final String? category;
  final String currency;
  final double price;
  final double? width;
  final double? vat;
  final List<Map<String, String>>? specs;
  final AppCardType type;
  final Function(
    int quantity, {
    String? id,
    String? name,
  })? onPressedAddToCart;

  @override
  State<AppProductCardWithSpecs> createState() =>
      _AppProductCardWithSpecsState();
}

class _AppProductCardWithSpecsState extends State<AppProductCardWithSpecs> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return (widget.type == AppCardType.elevated)
        ? AppCard.elevated(
            width: widget.width,
            child: _buildProductCardWithSpecs(context),
          )
        : (widget.type == AppCardType.filled)
            ? AppCard.filled(
                width: widget.width,
                child: _buildProductCardWithSpecs(context),
              )
            : AppCard.outlined(
                width: widget.width,
                child: _buildProductCardWithSpecs(context),
              );
  }

  Padding _buildProductCardWithSpecs(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppConstants.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.category != null) AppLabel(text: widget.category!),
          const SizedBox(height: AppConstants.sm),
          AppText.headlineMedium(widget.name),
          if (widget.sku != null) AppText.bodySmall('SKU: ${widget.sku}'),
          const SizedBox(height: AppConstants.sm),
          AppText.bodyMedium(widget.description, maxLines: 3),
          const SizedBox(height: AppConstants.sm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildQuantitySelector(context),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText.titleLarge(
                    '${widget.currency}${widget.price}',
                    fontWeight: FontWeight.bold,
                  ),
                  if (widget.vat != null)
                    AppText.bodySmall('+VAT ${widget.vat! / 100}%'),
                ],
              ),
            ],
          ),
          const SizedBox(height: AppConstants.sm),
          AppFilledButton(
            minimumSize: const Size.fromHeight(48.0),
            onPressed: () {
              if (widget.onPressedAddToCart == null) return;
              widget.onPressedAddToCart!(
                quantity,
                id: widget.id,
                name: widget.name,
              );
              setState(() {
                quantity = 0;
              });
            },
            child: AppText('Add to Cart'),
          ),
          if (widget.specs != null && widget.specs!.isNotEmpty) ...[
            const SizedBox(height: AppConstants.lg),
            AppText.headlineSmall('Specifications'),
            const SizedBox(height: AppConstants.lg),
            ...widget.specs!.asMap().entries.map((e) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText.bodyMedium(e.value['name']!),
                      AppText.bodyMedium(e.value['description']!),
                    ],
                  ),
                  const Divider(height: AppConstants.xlg),
                ],
              );
            }).toList(),
          ]
        ],
      ),
    );
  }

  Column _buildQuantitySelector(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.bodyMedium('QUANTITY', fontWeight: FontWeight.bold),
        const SizedBox(height: AppConstants.sm * 0.5),
        Container(
          height: 48.0,
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.sm,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: Colors.transparent,
                ),
                padding: EdgeInsets.zero,
                onPressed: () {
                  setState(() {
                    if (quantity == 0) return;
                    quantity = quantity - 1;
                  });
                },
                icon: Icon(
                  Icons.remove,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              SizedBox(
                width: 24,
                child: Center(
                  child: AppText.bodyLarge(
                    '$quantity',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: Colors.transparent,
                ),
                padding: EdgeInsets.zero,
                onPressed: () {
                  setState(() {
                    quantity = quantity + 1;
                  });
                },
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
