import 'package:flutter/material.dart';
import 'package:wave_custom_clone/core/helpers/helpers.dart' show SizesHelper;
import 'package:wave_custom_clone/presentation/components/components.dart' show ExtendedContainer;

class Separator extends StatelessWidget {
  const Separator({
    super.key,
    required this.value,
    this.onVertical = true,
    this.useAnimated = false,
  });
  final double value;
  final bool onVertical;
  final bool useAnimated;

  @override
  Widget build(BuildContext context) {
    if (onVertical) {
      if (useAnimated) {
        return ExtendedContainer(
          useAnimated: true,
          animatedTimeInMilliseconds: 200,
          height: SizesHelper.height(value),
        );
      } else {
        return SizedBox(height: SizesHelper.height(value));
      }
    } else {
      if (useAnimated) {
        return ExtendedContainer(
          useAnimated: true,
          animatedTimeInMilliseconds: 200,
          width: SizesHelper.width(value),
        );
      } else {
        return SizedBox(width: SizesHelper.width(value));
      }
    }
  }
}
