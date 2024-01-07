import 'package:smart_parking/themes/ColourThemes.dart' as palatte;
import 'package:flutter/material.dart';

class AppTheme extends ThemeExtension<AppTheme>{
  final Colors1 = palatte.c1;
  final Colors2 = palatte.c2;
  final Colors3 = palatte.c3;
  final Colors4 = palatte.c4;
  final Colors5 = palatte.c5;

  @override
  ThemeExtension<AppTheme> copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  ThemeExtension<AppTheme> lerp(covariant ThemeExtension<AppTheme>? other, double t) {
    // TODO: implement lerp
    throw UnimplementedError();
  }
}