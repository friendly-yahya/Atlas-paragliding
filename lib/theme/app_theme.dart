import 'package:flutter/material.dart';

class AppTheme {
  //======================================
  //COLORS  
  //======================================
  static const Color backgroundColor = Color(0xFFFAFAFA);
  static const Color searchBackgroundColor = Color(0xFFF5F5F5);
  static const Color textPrimary = Color(0xFF0A0A0A);
  static const Color textSecondary = Color(0xFF404040);
  static const Color strokeColor = Color(0xFFE5E5E5);
  static const Color primaryColor = Color(0xFF3B82F6);
  static const Color successColor = Color(0xFF22C55E);
  static const Color errorColor = Color(0xFFEF4444);
  static const Color starColor = Color(0xFFFACC15);
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
    letterSpacing: 0.05,
  );
  static const TextStyle heading2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: textPrimary,
    letterSpacing: 0.05,
  );  
  static const TextStyle heading3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: textPrimary,
    letterSpacing: 0.05,
  );  
  static const TextStyle heading4 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: textPrimary,
    letterSpacing: 0.05,
  );  
  //Body text
  static const TextStyle paragraphSmRegular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: textPrimary,
    letterSpacing: 0.05,
  );
  static const TextStyle paragraphSmMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: textPrimary,
    letterSpacing: 0.05,
  );
  static const TextStyle paragraphMiniRegular = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: textPrimary,
    letterSpacing: 0.05,
  );
  static const TextStyle paragraphMiniMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: textPrimary,
    letterSpacing: 0.05,
  );
  static const TextStyle micro = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: textPrimary,
    letterSpacing: 0.05,
  );
  static const TextStyle paragraphMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: textPrimary,
    letterSpacing: 0.05,
  );
  // ========================================
  // 5. COMPONENT STYLES
  // ========================================
  static final ButtonStyle primaryButton = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    foregroundColor: backgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(rounded8)
    ),
    elevation: 0,
    textStyle: paragraphSmMedium,
    );
  static final ButtonStyle browsingButtonDark = ElevatedButton.styleFrom(
    backgroundColor: textPrimary,
    foregroundColor: backgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(rounded8)
    ),
    elevation: 0,
    textStyle: paragraphSmMedium,
    padding :const EdgeInsets.symmetric(
      horizontal: space24,
      vertical: 9.5,
    ),

    );
  static final ButtonStyle browsingButtonLight = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    foregroundColor: backgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(rounded8)
    ),
    elevation: 0,
    textStyle: paragraphSmMedium,
    padding: EdgeInsets.symmetric(
      horizontal: space24,
      vertical: 9.5,
    ),
    
    );
  static final ButtonStyle bookingButtonLight = ElevatedButton.styleFrom(
    backgroundColor: textPrimary,
    foregroundColor: backgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(99)//might cause an error later on
    ),
    elevation: 0,
    textStyle: paragraphSmMedium,
    padding: EdgeInsets.symmetric(
      horizontal: space24,
      vertical: 9.5,
    ),
    
    );
    static final ButtonStyle bookMainButtonLight = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    foregroundColor: backgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(99)//might cause an error later on
    ),
    elevation: 0,
    textStyle: paragraphSmMedium,
    padding: EdgeInsets.symmetric(
      horizontal: space24,
      vertical: 9.5,
    ),
    
    );
    static ThemeData get lightTheme{
      return ThemeData(
        fontFamily: 'Geist',
        primaryColor: primaryColor,
        scaffoldBackgroundColor: backgroundColor,

        colorScheme: const ColorScheme.light(
          primary: primaryColor,
          error: errorColor,
          surface: backgroundColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(style: primaryButton),
        dividerTheme: DividerThemeData(
          color: strokeColor,
          thickness: 1,
        ),

      textTheme: const TextTheme(
      // Display (largest text)
      displayLarge: heading1,          // 30px
      displayMedium: heading2,         // 24px
      displaySmall: heading3,          // 20px
      
      // Headlines
      headlineMedium: heading4,        // 16px
      
      // Titles
      titleLarge: heading3,            // 20px
      titleMedium: heading4,           // 16px
      titleSmall: paragraphMedium,     // 16px medium
      
      // Body text
      bodyLarge: paragraphMedium,      // 16px medium
      bodyMedium: paragraphSmRegular,  // 14px regular
      bodySmall: paragraphMiniRegular, // 12px regular
      
      // Labels (buttons, badges)
      labelLarge: paragraphSmMedium,   // 14px medium
      labelMedium: paragraphMiniMedium,// 12px medium
      labelSmall: micro,               // 10px medium
    ),

        useMaterial3: true,
        );
    }
}