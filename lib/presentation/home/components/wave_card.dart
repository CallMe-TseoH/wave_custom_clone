import 'package:flutter/material.dart';
import 'package:wave_custom_clone/config/theme/theme.dart' show AppColors;
import 'package:wave_custom_clone/core/helpers/helpers.dart';
import 'package:wave_custom_clone/presentation/components/components.dart';

class WaveCard extends StatelessWidget {
  const WaveCard({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return ExtendedContainer(
      color: AppColors.blue,
      borderRadius: BorderRadius.circular(SizesHelper.radius(20)),
      height: SizesHelper.height(190),
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: SizesHelper.width(40)),
      image: const DecorationImage(image: AssetImage('assets/images/basic_card.png'), fit: BoxFit.cover),
      child: Center(
        child: ExtendedContainer(
          size: SizesHelper.height(160),
            child: Image.asset('assets/images/qr_code .png', fit: BoxFit.cover,)),
      ),
    );
  }
}

