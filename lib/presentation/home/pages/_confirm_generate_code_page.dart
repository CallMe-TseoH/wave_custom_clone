part of 'confirm_withdrawl_dialog.dart';

class _ConfirmGenerateCodePage extends StatelessWidget {
  const _ConfirmGenerateCodePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StretchingOverscrollIndicator(
      axisDirection: AxisDirection.down,
      child: ClipRRect(
        borderRadius: _buildBorderRadius,
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: SizesHelper.width(25)),
            child: Column(
              children: [
                TextComponent(
                  textKey: "5800",
                  color: Colors.grey.withOpacity(.65),
                  fontSize: AppFontSizesHelper.xxl*3,
                  fontWeight: FontWeight.bold,
                ),
                const Separator(value: 10),

                TextComponent(
                  textKey: "communiquer ce code uniquement à l'agent pour confirmer la demande de retrait.",
                  useOverFlow: false,
                  textAlign: TextAlign.center,
                  fontSize: AppFontSizesHelper.m,
                  color: AppColors.dark.withOpacity(.65),
                ),
                const Separator(value: 50),

                _ConfirmActionButton(
                  icon: Icons.close,
                  color: AppColors.dark,
                  onPressed: (){
                    Navigator.of(context).pop(true);
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BorderRadius get _buildBorderRadius => BorderRadius.vertical(top: Radius.circular(SizesHelper.radius(20)));
}
