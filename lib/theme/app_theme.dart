import 'package:flutter/material.dart';

class AppTheme {
  //======================================
  //COLORS  
  //======================================
  static const Color backgroundColor = Color(0xFFFAFAFA);
  static const Color textPrimary = Color(0xFF0A0A0A);
  static const Color textSecondary = Color(0xFF404040);
  static const Color strokeColor = Color(0xFFE5E5E5);
  static const Color primaryColor = Color(0xFF3B82F6);
  static const Color successColor = Color(0xFF22C55E);
  static const Color errorColor = Color(0xFFEF4444);
  //======================================
  //SPACING  
  //======================================
  static const double space2 = 2.0;
  static const double space4 = 4.0;
  static const double space8 = 8.0;
  static const double space12 = 12.0;
  static const double space16 = 16.0;
  static const double space24 = 24.0;
  static const double space32 = 32.0;
  static const double space48 = 48.0;
  //======================================
  //BORDER RADIUS  
  //======================================
  static const double rounded4 = 4.0;
  static const double rounded6 = 6.0;
  static const double rounded8 = 8.0;
  static const double rounded10 = 10.0;
  static const double rounded12 = 12.0;
  static const double rounded40 = 40.0;
  //======================================
  //TYPOGRAPHY  
  //======================================
  //Headings
  static const TextStyle heading1 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w600,
    color: textPrimary,
    letterSpacing: -0.5,
  );
  static const TextStyle heading2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: textPrimary,
    letterSpacing: -0.5,
  );  
  static const TextStyle heading3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: textPrimary,
    letterSpacing: -0.5,
  );  
  static const TextStyle heading4 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: textPrimary,
    letterSpacing: -0.5,
  );  
  //Body text
  static const TextStyle paragraphSmRegular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: textPrimary,
    letterSpacing: -0.5,
  );
  static const TextStyle paragraphSmMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: textPrimary,
    letterSpacing: -0.5,
  );
  static const TextStyle paragraphMiniRegular = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: textPrimary,
    letterSpacing: -0.5,
  );
  static const TextStyle paragraphMiniMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: textPrimary,
    letterSpacing: -0.5,
  );
  static const TextStyle micro = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: textPrimary,
    letterSpacing: -0.5,
  );
  static const TextStyle paragraphMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: textPrimary,
    letterSpacing: -0.5,
  );
  // ========================================
  // 5. COMPONENT STYLES
  // ========================================
  static final ButtonStyle primaryButtton = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    foregroundColor: backgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(rounded8)
    ),
    elevation: 0,
    textStyle: paragraphSmMedium,
    );
}