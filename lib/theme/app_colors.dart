import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Accessible palette (WCAG AA compliant)
  static const Color primary = Color(0xFF1565C0);
  static const Color primaryLight = Color(0xFF5E92F3);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color error = Color(0xFFB00020);
  static const Color textPrimary = Color(0xFF121212);
  static const Color textSecondary = Color(0xFF555555);
  static const Color success = Color(0xFF2E7D32);
  static const Color warning = Color(0xFFE65100);

  // Inaccessible palette (intentionally bad — for tutorial "before" state)
  static const inaccessible = _InaccessiblePalette();
}

final class _InaccessiblePalette {
  const _InaccessiblePalette();

  Color get textOnWhite => const Color(0xFFCCCCCC);
  Color get lightBlueOnWhite => const Color(0xFF90CAF9);
  Color get subtleSurface => const Color(0xFFF5F5F5);
  Color get labelOnSubtleSurface => const Color(0xFFBDBDBD);
  Color get paleGreenOnWhite => const Color(0xFFA5D6A7);
  Color get washedOrangeOnWhite => const Color(0xFFFFCC80);
}
