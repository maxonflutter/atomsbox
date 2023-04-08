part of '../../main.dart';

class _Molecules extends StatelessWidget {
  const _Molecules();

  @override
  Widget build(BuildContext context) {
    return AppBreakpoints.isMobile(context)
        ? SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                AppSegmentedButtonExample(),
                AppExpansionTileExample(),
                AppListTileExamples(),
                AppAppDefaultCardExamples(),
                AppAppUserCardExample(),
              ],
            ),
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      AppAppUserCardExample(),
                      AppAppDefaultCardExamples(),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: AppConstants.xlg),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      AppListTileExamples(),
                      AppSegmentedButtonExample(),
                      AppExpansionTileExample(),
                    ],
                  ),
                ),
              ),
            ],
          );
  }
}
