part of '../pages/confirm_withdrawl_dialog.dart';

class _WithDrawlDetailTile extends StatelessWidget {
  const _WithDrawlDetailTile({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextComponent(
          textKey: title,
          useOverFlow: false,
          textAlign: TextAlign.center,
          fontSize: AppFontSizesHelper.m,
          color: Colors.grey.withOpacity(.95),
          fontWeight: FontWeight.bold,
        ),
        const Separator(
          value: 10,
          onVertical: false,
        ),
        TextComponent(
          textKey: content,
          useOverFlow: false,
          textAlign: TextAlign.right,
          fontSize: AppFontSizesHelper.m,
          color: AppColors.dark.withOpacity(.9),
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}