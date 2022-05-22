part of '../pages/confirm_withdrawl_dialog.dart';

class _ConfirmWithFingerPrintButton extends StatelessWidget {
  const _ConfirmWithFingerPrintButton({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        controller.animateToPage(
          2,
          duration: const Duration(milliseconds: 200),
          curve: Curves.slowMiddle,
        );
      },
      child: Shimmer(
        gradient: LinearGradient(
          colors: [
            Colors.red,
            AppColors.purplishBlue,
            AppColors.white,
            AppColors.blue,
            AppColors.orange,
            Colors.green,
          ],
        ),
        child: Icon(
          Icons.fingerprint,
          size: AppFontSizesHelper.xxl * 2,
          color: AppColors.orange,
        ),
      ),
    );
  }
}
