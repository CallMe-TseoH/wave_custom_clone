part of '../pages/confirm_withdrawl_dialog.dart';

class _ConfirmActionButton extends StatelessWidget {
  const _ConfirmActionButton({
  super.key,
  required this.icon,
  required this.color, this.title, this.onPressed,

  });
final void Function()? onPressed;
  final IconData icon;
  final Color color;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return ExtendedContainer(
      size: SizesHelper.height(50),
      color: color.withOpacity(.35),
      shape: BoxShape.circle,
      child: MaterialInkWell(
        onPressed: onPressed??(){

        },
        customBorder: const CircleBorder(),
        splashColor: color.withOpacity(.25),
        child: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}
