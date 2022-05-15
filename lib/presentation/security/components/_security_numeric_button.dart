part of 'security_numeric_pad.dart';

class _SecurityNumericButton extends StatelessWidget {
  const _SecurityNumericButton({super.key, required this.value});

  final int value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<SecurityCubit>().onTapNumber(value);
      },
      child: ExtendedContainer(
        height: SizesHelper.height(75),
        color: AppColors.white,
        child: BlocBuilder<SecurityCubit, SecurityState>(
          buildWhen: (previous, current)=> previous.pin != current.pin,
          builder: (context, state) {
            return Center(
              child: _getValue == 12 ? Icon(state.pin.isNotEmpty? Icons.backspace_outlined: Icons.fingerprint_outlined) : TextComponent(
                textKey: _getValue == 10 ? context.l10n.securityForgottenPassword : _getValue.toString(),
                textAlign: TextAlign.center,
                fontWeight: FontWeight.bold,
                fontSize: _getValue == 10 ? AppFontSizesHelper.sm : AppFontSizesHelper.lxl - 1,
              ),
            );
          },
        ),
      ),
    );
  }

  int get _getValue => value == 11 ? 0 : value;
}
