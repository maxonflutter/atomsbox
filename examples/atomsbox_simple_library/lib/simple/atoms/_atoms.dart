part of '../../main.dart';

class _Atoms extends StatelessWidget {
  const _Atoms();

  @override
  Widget build(BuildContext context) {
    return AppBreakpoints.isMobile(context)
        ? SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                AppTextFormFieldsExample(),
                AppSliderExample(),
                AppCardsExample(),
                AppButtonsExample(),
                AppTextExample(),
                AppImageExample(),
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
                      AppSliderExample(),
                      AppButtonsExample(),
                      AppTextExample(),
                      AppImageExample(),
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
                      AppTextFormFieldsExample(),
                      AppCardsExample(),
                    ],
                  ),
                ),
              ),
            ],
          );
  }
}
