import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  static const Color kBgDeep  = Color(0xFF040713);
  static const Color kBgCard  = Color(0xFF191C28);
  static const Color kBgElevated = Color(0xFF252834);
  static const Color kPrimary = Color(0xFF3198FF);
  //======================================
  //SPACING  
  //======================================
  static const double space2 = 2.0;
  static const double space4 = 4.0;
  static const double space6 = 6.0;
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
  static const double rounded32 = 12.0;
  static const double rounded40 = 40.0;
//======================================
//TYPOGRAPHY  
//======================================
static final TextStyle kDisplayHero = GoogleFonts.workSans(
  fontSize: 48,
  fontWeight: FontWeight.w800,
  color: backgroundColor,
);
static final TextStyle kDisplaySub = GoogleFonts.workSans(
  fontSize: 18,
  fontWeight: FontWeight.w400,
  color: backgroundColor.withValues(alpha: 0.6),
);
// Headings
static final TextStyle heading1 = GoogleFonts.geist(
  fontSize: 30, 
  fontWeight: FontWeight.w600, 
  color: textPrimary, 
  letterSpacing: 0.05,
);
static final TextStyle heading2 = GoogleFonts.geist(
  fontSize: 24, 
  fontWeight: FontWeight.w600, 
  color: textPrimary, 
  letterSpacing: 0.05,
);
static final TextStyle heading3 = GoogleFonts.geist(
  fontSize: 20, 
  fontWeight: FontWeight.w600, 
  color: textPrimary, 
  letterSpacing: 0.05,
);
static final TextStyle heading4 = GoogleFonts.geist(
  fontSize: 16, 
  fontWeight: FontWeight.w600, 
  color: textPrimary, 
  letterSpacing: 0.05,
);
// Body
static final TextStyle paragraphSmRegular = GoogleFonts.geist(
  fontSize: 14, 
  fontWeight: FontWeight.w400, 
  color: textPrimary, 
  letterSpacing: 0.05,
);
static final TextStyle paragraphSmMedium = GoogleFonts.geist(
  fontSize: 14, 
  fontWeight: FontWeight.w500, 
  color: textPrimary, 
  letterSpacing: 0.05,
);
static final TextStyle paragraphMiniRegular = GoogleFonts.geist(
  fontSize: 12, 
  fontWeight: FontWeight.w400, 
  color: textPrimary, 
  letterSpacing: 0.05,
);
static final TextStyle paragraphMiniMedium = GoogleFonts.geist(
  fontSize: 12, 
  fontWeight: FontWeight.w500, 
  color: textPrimary, 
  letterSpacing: 0.05,
);
static final TextStyle micro = GoogleFonts.geist(
  fontSize: 10, 
  fontWeight: FontWeight.w500, 
  color: textPrimary, 
  letterSpacing: 0.05,
);
static final TextStyle paragraphMedium = GoogleFonts.geist(
  fontSize: 16, 
  fontWeight: FontWeight.w500, 
  color: textPrimary, 
  letterSpacing: 0.05,
);
  // ========================================
  // COMPONENT STYLES
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
  static final ButtonStyle bookingButtonDark = ElevatedButton.styleFrom(
    backgroundColor: backgroundColor,
    foregroundColor: textPrimary,
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

      textTheme: TextTheme(
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