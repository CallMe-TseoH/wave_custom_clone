import 'package:flutter/material.dart';
import 'package:wave_custom_clone/config/theme/theme.dart';
import 'package:wave_custom_clone/core/constant/constant.dart';
import 'package:wave_custom_clone/core/helpers/helpers.dart';
import 'package:wave_custom_clone/l10n/l10n.dart';
import 'package:wave_custom_clone/presentation/components/components.dart';
import 'package:wave_custom_clone/presentation/components/text_component.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_custom_clone/presentation/security/cubit/security_cubit.dart';
part '_security_numeric_button.dart';

class SecurityNumericPad extends StatelessWidget {
  const SecurityNumericPad({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: _getHorizontalMargin(context),
        right: _getHorizontalMargin(context),
        bottom: SizesHelper.height(10),
      ),
      child: Column(
        children: kNumbMatrixIndex.chunkList(chunkSize: 3).map((numbMatrixIndex) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: numbMatrixIndex
                .map((e) => Expanded(child: _SecurityNumericButton(value: e)))
                .toList(),
          );
        }).toList(),
      ),
    );
  }

  double _getHorizontalMargin(BuildContext context) => SizesHelper.width(10);
}
