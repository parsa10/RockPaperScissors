import 'package:flutter/material.dart';

class AppThemeData {
  static final lightTheme = ThemeData(
    extensions: const [
      CustomColors(
          shimmer: Color(0xFFEDEEF1),
          onBackground: Color(0xFFEDEEF1),
          textFieldBorder: Color(0xFFD0D4DA))
    ],
    brightness: Brightness.light,
    useMaterial3: true,
    colorScheme: lightColorScheme,
    fontFamily: 'IranYekan',
    textTheme: textTheme(),
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: Color(0xFFEDEEF1)),
  );

  static final darkTheme = ThemeData(
    extensions: const [
      CustomColors(
          shimmer: Color(0xFF212528),
          onBackground: Color(0xFF1D2123),
          textFieldBorder: Color(0xFF252C2D))
    ],
    brightness: Brightness.dark,
    useMaterial3: true,
    colorScheme: darkColorScheme,
    textTheme: textTheme(),
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: Color(0xFF1D2123)),
  );

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF68D3FF),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFBDE9FF),
    onPrimaryContainer: Color(0xFF001F2A),
    secondary: Color(0xFF4D616C),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFD0E6F2),
    onSecondaryContainer: Color(0xFF081E27),
    tertiary: Color(0xFF5D5B7D),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFE3DFFF),
    onTertiaryContainer: Color(0xFF1A1836),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFBFCFE),
    onBackground: Color(0xFF191C1E),
    surface: Color(0xFFFBFCFE),
    onSurface: Color(0xFF191C1E),
    surfaceVariant: Color(0xFFDCE4E9),
    onSurfaceVariant: Color(0xFF40484C),
    outline: Color(0xFF70787D),
    onInverseSurface: Color(0xFFEFF1F3),
    inverseSurface: Color(0xFF2E3132),
    inversePrimary: Color(0xFF68D3FF),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF006684),
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF68D3FF),
    onPrimary: Color(0xFF003546),
    primaryContainer: Color(0xFF004D64),
    onPrimaryContainer: Color(0xFFBDE9FF),
    secondary: Color(0xFFB4CAD6),
    onSecondary: Color(0xFF1F333C),
    secondaryContainer: Color(0xFF354A53),
    onSecondaryContainer: Color(0xFFD0E6F2),
    tertiary: Color(0xFFC6C2EA),
    onTertiary: Color(0xFF2F2D4D),
    tertiaryContainer: Color(0xFF454364),
    onTertiaryContainer: Color(0xFFE3DFFF),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF191C1E),
    onBackground: Color(0xFFE1E2E4),
    surface: Color(0xFF191C1E),
    onSurface: Color(0xFFE1E2E4),
    surfaceVariant: Color(0xFF40484C),
    onSurfaceVariant: Color(0xFFC0C8CD),
    outline: Color(0xFF8A9297),
    onInverseSurface: Color(0xFF191C1E),
    inverseSurface: Color(0xFFE1E2E4),
    inversePrimary: Color(0xFF006684),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF68D3FF),
  );

  static TextTheme textTheme() {
    String fontName = 'IranYekan';
    return TextTheme(
      displayLarge: TextStyle(
          fontFamily: fontName, fontWeight: FontWeight.w800, fontSize: 57),
      displayMedium: TextStyle(
          fontFamily: fontName, fontWeight: FontWeight.w700, fontSize: 45),
      displaySmall: TextStyle(
          fontFamily: fontName, fontWeight: FontWeight.w700, fontSize: 36),
      headlineLarge: TextStyle(
          fontFamily: fontName, fontWeight: FontWeight.w600, fontSize: 32),
      headlineMedium: TextStyle(
          fontFamily: fontName, fontWeight: FontWeight.w500, fontSize: 28),
      headlineSmall: TextStyle(
          fontFamily: fontName, fontWeight: FontWeight.w500, fontSize: 24),
      titleLarge: TextStyle(
          fontFamily: fontName, fontWeight: FontWeight.w500, fontSize: 22),
      titleMedium: TextStyle(
          fontFamily: fontName, fontWeight: FontWeight.w500, fontSize: 18),
      titleSmall: TextStyle(
          fontFamily: fontName, fontWeight: FontWeight.w400, fontSize: 14),
      labelLarge: TextStyle(
          fontFamily: fontName, fontWeight: FontWeight.w300, fontSize: 16),
      labelMedium: TextStyle(
          fontFamily: fontName, fontWeight: FontWeight.w300, fontSize: 12),
      labelSmall: TextStyle(
          fontFamily: fontName, fontWeight: FontWeight.w300, fontSize: 11),
      bodyLarge: TextStyle(
          fontFamily: fontName, fontWeight: FontWeight.w300, fontSize: 16),
      bodyMedium: TextStyle(
          fontFamily: fontName, fontWeight: FontWeight.w300, fontSize: 14),
      bodySmall: TextStyle(
          fontFamily: fontName, fontWeight: FontWeight.w300, fontSize: 12),
    );
  }
}

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.shimmer,
    required this.onBackground,
    required this.textFieldBorder,
  });

  final Color? shimmer;
  final Color? onBackground;
  final Color? textFieldBorder;

  @override
  CustomColors copyWith(
      {Color? shimmer, Color? onBackground, Color? textFieldBorder}) {
    return CustomColors(
      shimmer: shimmer ?? this.shimmer,
      onBackground: onBackground ?? this.onBackground,
      textFieldBorder: textFieldBorder ?? this.textFieldBorder,
    );
  }

  @override
  ThemeExtension<CustomColors> lerp(
      ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      shimmer: Color.lerp(shimmer, other.shimmer, t),
      onBackground: Color.lerp(onBackground, other.onBackground, t),
      textFieldBorder: Color.lerp(textFieldBorder, other.textFieldBorder, t),
    );
  }
}
