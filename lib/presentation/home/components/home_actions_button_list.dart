import 'package:flutter/material.dart';
import 'package:wave_custom_clone/config/theme/app_colors.dart';
import 'package:wave_custom_clone/core/helpers/helpers.dart';
import 'package:wave_custom_clone/l10n/l10n.dart';
import 'package:wave_custom_clone/presentation/components/components.dart';

part '_action_button.dart';
class HomeActionsButtonList extends StatelessWidget {
  const HomeActionsButtonList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Separator(value: 65),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _ActionButton(title: context.l10n.homeTransferBtnTitle, color: AppColors.purplishBlue, onPressed: (){

            }, image: 'assets/icons/transfer_to_person_icon.png'),
            _ActionButton(title: context.l10n.homeBillBtnTitle, color: AppColors.orange, onPressed: (){

            }, image:'assets/icons/pay_bill_icon.png'),

          ],
        ),
      ],
    );

  }
}
