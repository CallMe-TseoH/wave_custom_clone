import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_custom_clone/config/theme/theme.dart' show AppColors;
import 'package:wave_custom_clone/core/helpers/helpers.dart' show SizesHelper;
import 'package:wave_custom_clone/presentation/components/components.dart' show ExtendedContainer;
import 'package:wave_custom_clone/presentation/security/cubit/security_cubit.dart';

class SecurityPinField extends StatelessWidget {

  const SecurityPinField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return BlocBuilder<SecurityCubit, SecurityState>(
          buildWhen: (previous, current)=> previous.pin != current.pin,
          builder: (_, state) {
            return ExtendedContainer(
              shape: BoxShape.circle,
              color: AppColors.blue.withOpacity(state.pin.length>index? 1:.35),
              size: SizesHelper.height(15),
              useAnimated: true,
              animatedTimeInMilliseconds: 200,
              margin: EdgeInsets.symmetric(horizontal: SizesHelper.width(5)),
            );
          },
        );
      }),
    );
  }
}
