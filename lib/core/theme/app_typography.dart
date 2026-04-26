import 'package:flutter/cupertino.dart';
import 'app_colors.dart';

abstract final class AppTypography {
  static TextStyle get _base =>
      const TextStyle(fontFamily: 'Poppins', color: AppColors.textPrimary);

  static TextStyle get heading1 =>
      _base.copyWith(fontSize: 36, fontWeight: FontWeight.bold);

  static TextStyle get subHeading =>
      _base.copyWith(fontSize: 24, fontWeight: FontWeight.w500);

  static TextStyle get body =>
      _base.copyWith(fontSize: 16, fontWeight: FontWeight.w400);

  static TextStyle get button => _base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textOnPrimary,
  );
}
