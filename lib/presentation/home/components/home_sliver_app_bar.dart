import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_custom_clone/config/theme/theme.dart' show AppColors;
import 'package:wave_custom_clone/core/constant/constant.dart';
import 'package:wave_custom_clone/core/constant/shadow.dart';
import 'package:wave_custom_clone/core/helpers/helpers.dart';
import 'package:wave_custom_clone/presentation/about/about_me.dart';
import 'package:wave_custom_clone/presentation/components/components.dart';
import 'package:wave_custom_clone/presentation/home/components/confirm_with_drawl_button.dart';

const _kScale = 1.0;

class HomeSliverAppBar extends SliverPersistentHeaderDelegate {
  const HomeSliverAppBar({
    required this.title,
    this.backgroundColor,
    required this.maxHeight,
    required this.minHeight,
  });

  final String title;
  final Color? backgroundColor;
  final double maxHeight;
  final double minHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final _maxTitlePadding = maxExtent - (maxExtent / 1.45);
    final _titleTopPadding = _getDifferenceBetweenShrinkOffsetAndMaxTitlePadding(
      _maxTitlePadding,
      shrinkOffset,
    ).isNegative
        ? 0.0
        : _getDifferenceBetweenShrinkOffsetAndMaxTitlePadding(
            _maxTitlePadding,
            shrinkOffset,
          );
    final _getTitleScale = _kScale + (_titleTopPadding / 135);
    return ExtendedContainer(
      width: double.infinity,
      color: backgroundColor ?? AppColors.purplishBlue,
      height: maxHeight,
      boxShadow: !(_titleTopPadding > 5)
          ? [
              outerShadow,
            ]
          : null,
      padding: EdgeInsets.only(top: SizesHelper.height(minExtent / 5)),
      child: Row(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                  duration: const Duration(seconds: 60),
                      backgroundColor: AppColors.white,
                      padding: EdgeInsets.symmetric(horizontal: SizesHelper.width(0), vertical: 5),
                      content: const ConfirmWithDrawlButton(),
                    ),
                  );
              },
              icon: Icon(
                Icons.settings,
                color: AppColors.white,
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                AnimatedPositioned(
                  top: SizesHelper.height(_titleTopPadding),
                  left: 0,
                  right: 0,
                  duration: const Duration(milliseconds: 50),
                  child: Transform.scale(
                    scale: _getTitleScale,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 5, bottom: !(_titleTopPadding > 0) ? 25 : 0),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                TextComponent(
                                  textKey: title,
                                  textStyle: TextStyle(
                                    fontFamily: kFontOPTIsupAuvantGothicBold,
                                    color: AppColors.white,
                                    fontSize: AppFontSizesHelper.xl,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                TextComponent(
                                  textKey: 'F',
                                  textStyle: TextStyle(
                                    fontFamily: kFontOPTIsupAuvantGothicBold,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: AppFontSizesHelper.sm,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            Positioned(
                                right: -SizesHelper.width(25),
                                top: 0,
                                bottom: 0,
                                child: Center(
                                    child: Icon(
                                  Icons.visibility,
                                  size: AppFontSizesHelper.sm,
                                  color: AppColors.white.withOpacity(.75),
                                )))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AboutMe.routeName);
    },
                  icon: Icon(
                    Icons.info,
                    color: AppColors.white,
                  ))),
        ],
      ),
    );
  }

  double _getDifferenceBetweenShrinkOffsetAndMaxTitlePadding(
    double _maxTitlePadding,
    double shrinkOffset,
  ) =>
      _maxTitlePadding - shrinkOffset;

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
