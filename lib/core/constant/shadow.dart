import 'package:flutter/material.dart';

BoxShadow outerShadow = BoxShadow(
  color: Colors.black.withOpacity(.15),
  offset: const Offset(0, 1),
  blurStyle: BlurStyle.outer,
  blurRadius: 8,
);
BoxShadow outerShadowSmall = BoxShadow(
  color: Colors.black.withOpacity(.085),
  offset: const Offset(0, .8),
  blurStyle: BlurStyle.outer,
  blurRadius: 5,
);
