import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_custom_clone/core/helpers/helpers.dart' show AppFontSizesHelper;

class TextComponent extends StatelessWidget {
  const TextComponent({
    super.key,
    required this.textKey,
    this.textAlign,
    this.color,
    this.fontWeight,
    this.fontFamily,
    this.fontSize,
    this.letterSpacing,
    this.decoration,
    this.useOverFlow = true,
    this.lineHeight,
    this.useTranslation = true,
    this.textParams,
    this.maxLine,
    this.textShadow, this.textStyle,
  });

  final String textKey;
  final TextAlign? textAlign;
  final Color? color;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final double? fontSize;
  final double? letterSpacing;
  final TextDecoration? decoration;
  final bool? useOverFlow;
  final int? maxLine;
  final bool useTranslation;
  final double? lineHeight;
  final List<BoxShadow>? textShadow;
  final Map<String, String>? textParams;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      textKey,
      textAlign: textAlign ?? TextAlign.left,
      overflow: useOverFlow! ? TextOverflow.ellipsis : TextOverflow.visible,
      maxLines: maxLine,
      style:textStyle?? GoogleFonts.inter(
          color: color ?? Colors.black,
          fontWeight: fontWeight ?? FontWeight.normal,
          height: lineHeight,
          fontSize: fontSize ?? AppFontSizesHelper.l,
          decoration: decoration,
          letterSpacing: letterSpacing,
          shadows: textShadow,),
    );
  }
}
