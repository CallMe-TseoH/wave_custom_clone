part of 'home_actions_button_list.dart';

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    super.key,
    required this.color,
    required this.title,
    required this.onPressed,
    required this.image,
  });

  final Color color;
  final String title;
  final String image;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: SizesHelper.height(36),
          backgroundColor: color.withOpacity(.5),
          backgroundImage: AssetImage(image),
        ),
        const Separator(value: 8),
        TextComponent(
          textKey: title,
          fontSize: AppFontSizesHelper.sm - 1,
          fontWeight: FontWeight.w600,
        )
      ],
    );
  }
}
