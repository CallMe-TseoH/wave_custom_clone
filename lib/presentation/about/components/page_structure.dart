import 'package:flutter/material.dart';
import 'package:wave_custom_clone/core/helpers/helpers.dart';
import 'package:wave_custom_clone/presentation/components/components.dart';

class PageStructure extends StatelessWidget {
  const PageStructure({Key? key, this.appBar, required this.body, this.backgroundColor, this.appBarAndBodySeparatorHeight}) : super(key: key);
  final Widget? appBar;
  final Widget body;
  final Color? backgroundColor;
  final double? appBarAndBodySeparatorHeight;
  @override
  Widget build(BuildContext context) {
    return ExtendedContainer(
      color: _backgroundColor,
      constraints: const BoxConstraints.tightForFinite(),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(child: body, left: 0, right: 0, top: appBar != null? _topSeparator : 0, bottom: 0,),
          if(appBar !=null)Positioned(child: appBar!, top: 0, left: 0,right: 0, height: _topSeparator,),
        ],
      ),

    );
  }

  double get _topSeparator => appBarAndBodySeparatorHeight??SizesHelper.height(95);
  Color get _backgroundColor => backgroundColor??Colors.grey.shade200;

}
