import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wave_custom_clone/config/theme/theme.dart' show AppColors;
import 'package:wave_custom_clone/core/constant/shadow.dart';
import 'package:wave_custom_clone/core/helpers/helpers.dart' show AppFontSizesHelper, SizesHelper;
import 'package:wave_custom_clone/presentation/components/components.dart';
import 'package:wave_custom_clone/presentation/home/pages/confirm_withdrawl_dialog.dart';

class ConfirmWithDrawlButton extends StatelessWidget {
  const ConfirmWithDrawlButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExtendedContainer(
      height: SizesHelper.height(70),
      margin: EdgeInsets.symmetric(horizontal: SizesHelper.width(25)),
      boxShadow: [
        outerShadowSmall,
      ],
      borderRadius: _buildBorderRadius(),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: AppColors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: _buildBorderRadius(),
            ),
          ),
          onPressed: () {
            showModalBottomSheet<bool>(context: context, builder: (_){
              return const ConfirmWithDrawlDialog();
            },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(SizesHelper.radius(20))),
              ),
              constraints: BoxConstraints(
                minHeight: SizesHelper.height(300),
                maxHeight: SizesHelper.height(500),
                minWidth: double.infinity,
              ),
            ).then((value){
              try{
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              }catch(_){

              }
            });
          },
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: -10,
                  right: -10,
                  child: Icon(
                Icons.security,
                color: Colors.grey.shade50.withOpacity(.1),
                size: AppFontSizesHelper.xxl*2,
              ),),
              Positioned(
                bottom: -30,
                left: -10,
                child: Icon(
                  Icons.security,
                  color: Colors.grey.shade50.withOpacity(.15),
                  size: AppFontSizesHelper.xxl*2,
                ),),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Shimmer(
                    gradient: LinearGradient(colors: [
                      Colors.red,
                      AppColors.purplishBlue,
                      AppColors.white,
                      AppColors.blue,
                      AppColors.orange,
                      Colors.green,
                    ],),
                    child: Icon(
                      Icons.security,
                      size: AppFontSizesHelper.ml,
                    ),
                  ),
                  const Separator(
                    value: 10,
                    onVertical: false,
                  ),
                  TextComponent(
                    textKey: 'Confirmer une demande de retrait',
                    fontSize: AppFontSizesHelper.sm,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
            ],
          )),
    );
  }

  BorderRadius _buildBorderRadius() {
    return BorderRadius.circular(
              SizesHelper.radius(20),
            );
  }
}
