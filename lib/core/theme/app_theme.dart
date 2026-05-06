import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color _clientPrimary     = Color(0xFF3B82F6);
  static const Color _clientSurface     = Color(0xFFFAFAFA);
  static const Color _clientOnSurface   = Color(0xFF0A0A0A);
  static const Color _clientSecondary   = Color(0xFF404040);
  static const Color _clientStroke      = Color(0xFFE5E5E5);
  static const Color _clientSearchBg    = Color(0xFFF5F5F5);

  static const Color _pilotPrimary      = Color(0xFF3198FF);
  static const Color _pilotSurface      = Color(0xFF040713);  // kBgDeep
  static const Color _pilotOnSurface    = Color(0xFFEEF0F5);  // kTextPrimary
  static const Color _pilotCard         = Color(0xFF191C28);  // kBgCard
  static const Color _pilotElevated     = Color(0xFF252834);  // kBgElevated
  static const Color _pilotStroke       = Color(0x1AFFFFFF);

  static const Color starColor    = Color(0xFFFACC15);
  static const Color successColor = Color(0xFF22C55E);
  static const Color errorColor   = Color(0xFFEF4444);

  static const ColorScheme _clientLight = ColorScheme.light(
    primary:                    _clientPrimary,
    surface:                    _clientSurface,
    onSurface:                  _clientOnSurface,
    onSurfaceVariant:           _clientSecondary,  
    outline:                    _clientStroke,
    surfaceContainerHighest:    _clientSearchBg,
    error:                      errorColor,
  );
  static const ColorScheme _pilotDark = ColorScheme.dark(
    primary:                    _pilotPrimary,
    surface:                    _pilotSurface,
    onSurface:                  _pilotOnSurface,
    onSurfaceVariant:           Color(0xFF6B7280),
    outline:                    _pilotStroke,
    surfaceContainerHighest:    _pilotCard,
    surfaceContainer:           _pilotElevated,
    error:                      errorColor,
  );

  static const double space2 = 2.0;
  static const double space4 = 4.0;
  static const double space6 = 6.0;
  static const double space8 = 8.0;
  static const double space12 = 12.0;
  static const double space16 = 16.0;
  static const double space24 = 24.0;
  static const double space32 = 32.0;
  static const double space48 = 48.0;

  static const double rounded4 = 4.0;
  static const double rounded6 = 6.0;
  static const double rounded8 = 8.0;
  static const double rounded10 = 10.0;
  static const double rounded12 = 12.0;
  static const double rounded32 = 12.0;
  static const double rounded40 = 40.0;

  static TextStyle kDisplayHero(BuildContext context) => GoogleFonts.workSans(
    fontSize: 48,
    fontWeight: FontWeight.w800,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle kDisplaySub(BuildContext context) => GoogleFonts.workSans(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
  );
// usage
//style: AppTheme.kDisplayHero(context)
  static final TextStyle heading1 = GoogleFonts.geist(fontSize: 30, fontWeight: FontWeight.w600, letterSpacing: 0.05);
  static final TextStyle heading2 = GoogleFonts.geist(fontSize: 24, fontWeight: FontWeight.w600, letterSpacing: 0.05);
  static final TextStyle heading3 = GoogleFonts.geist(fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 0.05);
  static final TextStyle heading4 = GoogleFonts.geist(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0.05);
  static final TextStyle paragraphSmRegular  = GoogleFonts.geist(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.05);
  static final TextStyle paragraphSmMedium   = GoogleFonts.geist(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.05);
  static final TextStyle paragraphMiniRegular= GoogleFonts.geist(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.05);
  static final TextStyle paragraphMiniMedium = GoogleFonts.geist(fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.05);
  static final TextStyle paragraphMedium     = GoogleFonts.geist(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.05);
  static final TextStyle micro               = GoogleFonts.geist(fontSize: 10, fontWeight: FontWeight.w500, letterSpacing: 0.05);

  static ThemeData get clientLightTheme => ThemeData(
    colorScheme: _clientLight,
    useMaterial3: true,
    scaffoldBackgroundColor: _clientSurface,
    textTheme: _buildTextTheme(_clientLight),
  );

  static ThemeData get clientDarkTheme => ThemeData(
    colorScheme: _clientLight.copyWith(  
      surface:    Color(0xFF1A1A1A),
      onSurface:  Color(0xFFEEEEEE),
      outline:    Color(0xFF333333),
      surfaceContainerHighest: Color(0xFF2A2A2A),
    ),
    useMaterial3: true,
    textTheme: _buildTextTheme(ColorScheme.dark(
      surface: Color(0xFF1A1A1A), onSurface: Color(0xFFEEEEEE),
    )),
  );

  static ThemeData get pilotDarkTheme => ThemeData(
    colorScheme: _pilotDark,
    useMaterial3: true,
    scaffoldBackgroundColor: _pilotSurface,
    textTheme: _buildTextTheme(_pilotDark),
  );

  static ThemeData get pilotLightTheme => ThemeData(
    colorScheme: _pilotDark.copyWith(  
      surface:    Color(0xFFF0F4FF),
      onSurface:  Color(0xFF0A0A1A),
      surfaceContainerHighest: Color(0xFFDDE5FF),
      outline:    Color(0xFFCDD5FF),
    ),
    useMaterial3: true,
    textTheme: _buildTextTheme(ColorScheme.light(
      surface: Color(0xFFF0F4FF), onSurface: Color(0xFF0A0A1A),
    )),
  );


  static TextTheme _buildTextTheme(ColorScheme cs) => TextTheme(
    displayLarge:   heading1.copyWith(color: cs.onSurface),
    displayMedium:  heading2.copyWith(color: cs.onSurface),
    displaySmall:   heading3.copyWith(color: cs.onSurface),
    headlineMedium: heading4.copyWith(color: cs.onSurface),
    titleLarge:     heading3.copyWith(color: cs.onSurface),
    titleMedium:    heading4.copyWith(color: cs.onSurface),
    bodyLarge:      paragraphMedium.copyWith(color: cs.onSurface),
    bodyMedium:     paragraphSmRegular.copyWith(color: cs.onSurface),
    bodySmall:      paragraphMiniRegular.copyWith(color: cs.onSurfaceVariant),
    labelLarge:     paragraphSmMedium.copyWith(color: cs.onSurface),
    labelMedium:    paragraphMiniMedium.copyWith(color: cs.onSurface),
    labelSmall:     micro.copyWith(color: cs.onSurface),
  );

  static ButtonStyle primaryButton(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return TextButton.styleFrom(
      backgroundColor: cs.primary,
      foregroundColor: cs.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(rounded8)),
      textStyle: paragraphSmMedium,
      padding: const EdgeInsets.symmetric(horizontal: space16, vertical: 12),
    );
  }

  static ButtonStyle pillButtonDark(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return TextButton.styleFrom(
      backgroundColor: cs.onSurface,
      foregroundColor: cs.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(99)),
      textStyle: paragraphSmMedium,
      padding: const EdgeInsets.symmetric(horizontal: space24, vertical: 9),
    );
  }

  static ButtonStyle pillButtonPrimary(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return TextButton.styleFrom(
      backgroundColor: cs.primary,
      foregroundColor: cs.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(99)),
      textStyle: paragraphSmMedium,
      padding: const EdgeInsets.symmetric(horizontal: space24, vertical: 9),
    );
  }
}