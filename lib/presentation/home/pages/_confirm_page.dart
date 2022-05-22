part of 'confirm_withdrawl_dialog.dart';

class _ConfirmPage extends StatelessWidget {
  const _ConfirmPage({
  super.key, required this.controller,
  }) ;

final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Icon(
          Icons.security,
          size: AppFontSizesHelper.xxl * 7,
          color: AppColors.orange.withOpacity(.085),
        ),
        Positioned.fill(
          child: Column(
            children: [
              Expanded(
                child: StretchingOverscrollIndicator(
                  axisDirection: AxisDirection.down,
                  child: ClipRRect(
                    borderRadius: _buildBorderRadius,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: SizesHelper.width(25)),
                      child: Column(
                        children: [
                          TextComponent(
                            textKey: 'Demande de retrait',
                            useOverFlow: false,
                            textAlign: TextAlign.center,
                            fontSize: AppFontSizesHelper.l,
                            color: AppColors.dark,
                          ),
                          const Separator(value: 20),
                          const _WithDrawlDetailTile(
                            title: 'Montant :',
                            content: '50.000F',
                          ),
                          const _TileSeparator(),
                          const _WithDrawlDetailTile(
                            title: 'Frais :',
                            content: '0.0F',
                          ),
                          const _TileSeparator(),
                          const _WithDrawlDetailTile(
                            title: 'Initié par :',
                            content: 'Lavigne Wave',
                          ),
                          const _TileSeparator(),
                          _WithDrawlDetailTile(
                            title: 'Date & Heure :',
                            content: DateFormat.yMMMMd().add_Hm().format(DateTime.now()),
                          ),
                          const _TileSeparator(),
                          const _WithDrawlDetailTile(
                            title: 'Solde après retrait :',
                            content: '530.000F',
                          ),
                          const _TileSeparator(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizesHelper.width(20), vertical: SizesHelper.height(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children:  [
                    _ConfirmActionButton(
                      icon: Icons.close,
                      color: AppColors.purplishBlue,
                      onPressed: (){
                        Navigator.of(context).pop(true);
                      },
                    ),
                     _ConfirmWithFingerPrintButton(controller:controller),
                    const _ConfirmActionButton(
                      icon: Icons.warning,
                      color: Colors.red,
                      title: 'Réjéter ?',
                    ),
                  ],
                ),
              ),
              const Separator(value: 10),

              TextComponent(
                textKey: 'confirmer ou réjéter cette opération',
                useOverFlow: false,
                textAlign: TextAlign.center,
                fontSize: AppFontSizesHelper.sm,
                color: AppColors.dark.withOpacity(.65),
              ),
              const Separator(value: 10),
            ],
          ),
        ),
      ],
    );
  }

  BorderRadius get _buildBorderRadius => BorderRadius.vertical(top: Radius.circular(SizesHelper.radius(20)));

}
