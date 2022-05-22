part of '../pages/confirm_withdrawl_dialog.dart';

class _TileSeparator extends StatelessWidget {
  const _TileSeparator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Separator(value: 15),
        Divider(),
      ],
    );
  }
}