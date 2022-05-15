part of 'security_numeric_pad.dart';

class _SecurityNumericButton extends StatelessWidget {
  const _SecurityNumericButton({super.key, required this.value});
  final int value;

  @override
  Widget build(BuildContext context) {
    return TextComponent(
      textKey: value.toString(),
      textAlign: TextAlign.center,
      fontWeight: FontWeight.w600,
    );
  }
}
