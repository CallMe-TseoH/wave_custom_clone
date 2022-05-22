import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wave_custom_clone/config/theme/theme.dart';
import 'package:wave_custom_clone/core/constant/shadow.dart';
import 'package:wave_custom_clone/core/helpers/helpers.dart';
import 'package:wave_custom_clone/presentation/components/components.dart';

part '_confirm_page.dart';
part '_confirm_generate_code_page.dart';
part '../components/_tile_separator.dart';
part '../components/_with_drawl_detail_tile.dart';
part '../components/_confirm_with_finger_print_button.dart';
part '../components/_confirm_action_button.dart';

class ConfirmWithDrawlDialog extends HookWidget {
  const ConfirmWithDrawlDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final _pageController = usePageController();
    return ExtendedContainer(
      color: AppColors.white,
      borderRadius: _buildBorderRadius,
      // size: SizesHelper.height(300),
      boxShadow: [outerShadowSmall],
      child: Column(
        children: [
          ExtendedContainer(
            width: SizesHelper.width(70),
            height: 8,
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey.shade300,
            margin: const EdgeInsets.symmetric(vertical: 8),
          ),
          const Separator(value: 10),
          Expanded(
            child: StretchingOverscrollIndicator(
              axisDirection: AxisDirection.right,
              child: PageView(
                controller:_pageController,
                physics: const NeverScrollableScrollPhysics(),
                children:  [
                  _ConfirmPage(controller: _pageController),
                  const _ConfirmGenerateCodePage()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  BorderRadius get _buildBorderRadius => BorderRadius.vertical(top: Radius.circular(SizesHelper.radius(20)));
}








