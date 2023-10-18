import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_demo/utils/index.dart';

abstract class AppTheme {
  static const margin = 16.0;

  static const primary = Color(0xFF0093F4);
  static const success = Color(0xFF33D294);
  static const warning = Color(0xFFEB5C64);
  static const error = Color(0xFFDA1414);
  static const info = Color(0xFF2E5AAC);

  static ThemeMode mode = ThemeMode.system;

  static SystemUiOverlayStyle get systemStyle => const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      );

  static SystemUiOverlayStyle get systemStyleLight => systemStyle.copyWith(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      );

  static SystemUiOverlayStyle get systemStyleDark => systemStyle.copyWith(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: const Color(0xFF0D0D0D),
        systemNavigationBarIconBrightness: Brightness.light,
      );

  static void setSystemStyle() {
    switch (mode) {
      case ThemeMode.system:
        if (Screen.mediaQuery.platformBrightness == Brightness.dark) {
          SystemChrome.setSystemUIOverlayStyle(systemStyleDark);
        } else {
          SystemChrome.setSystemUIOverlayStyle(systemStyleLight);
        }
        break;
      case ThemeMode.light:
        SystemChrome.setSystemUIOverlayStyle(systemStyleLight);
        break;
      case ThemeMode.dark:
        SystemChrome.setSystemUIOverlayStyle(systemStyleDark);
        break;
    }
  }

  static ThemeData get light {
    final scheme = ColorScheme.light(
      background: const Color(0xFFF7F7F7),
      onBackground: const Color(0xFF333333),
      surface: Colors.white,
      onSurface: const Color(0xFF333333),
      primary: primary,
      onPrimary: Colors.white,
      secondary: const Color(0xFF999999),
      onSecondary: Colors.white,
      tertiary: const Color(0xFFF4F6F9),
      onTertiary: const Color(0xFF8D97A6),
      outline: const Color(0xFFEDEDED),
      shadow: const Color(0xFFD0DAD6).withOpacity(0.22),
      error: error,
      onError: Colors.white,
    );
    return _getTheme(scheme);
  }

  static ThemeData get dark {
    final scheme = ColorScheme.dark(
      background: const Color(0xFF0D0D0D),
      onBackground: Colors.white,
      surface: const Color(0xFF252525),
      onSurface: Colors.white,
      primary: primary,
      onPrimary: Colors.white,
      secondary: const Color(0xFFFFB800),
      onSecondary: Colors.white,
      tertiary: const Color(0xFF141414),
      outline: const Color(0xFF252525),
      shadow: const Color(0xFF777777).withOpacity(0.08),
      error: error,
      onError: Colors.white,
    );
    return _getTheme(scheme);
  }

  static ThemeData _getTheme(ColorScheme scheme) {
    return ThemeData(
      useMaterial3: false,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.background,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      dialogTheme: DialogTheme(
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 18.w,
          fontWeight: FontWeight.w600,
        ),
        contentTextStyle: TextStyle(fontSize: 17.w),
        backgroundColor: scheme.brightness == Brightness.light
            ? scheme.surface
            : scheme.tertiary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.w),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        elevation: 0,
        backgroundColor: scheme.brightness == Brightness.light
            ? scheme.surface
            : scheme.tertiary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.w),
            topRight: Radius.circular(15.w),
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        scrolledUnderElevation: 0,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 44.w,
        iconTheme: IconThemeData(
          color: scheme.onSurface,
          size: 24.w,
        ),
        titleTextStyle: TextStyle(
          color: scheme.onSurface,
          fontSize: 20.w,
          fontWeight: FontWeight.w600,
          height: 1.2,
        ),
        toolbarTextStyle: TextStyle(
          color: scheme.onSurface,
          fontSize: 20.w,
          fontWeight: FontWeight.w600,
          height: 1.2,
        ),
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          fontSize: 16.w,
          color: scheme.onBackground,
        ),
        labelLarge: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16.w,
          height: 1.2,
          color: scheme.onBackground,
        ),
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        elevation: 0,
        color: scheme.surface,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: scheme.surface,
        unselectedItemColor: scheme.onSurface.withOpacity(0.5),
        selectedItemColor: scheme.primary,
        unselectedLabelStyle: TextStyle(fontSize: 13.w, height: 1.6),
        selectedLabelStyle: TextStyle(fontSize: 13.w, height: 1.6),
        unselectedIconTheme: IconThemeData(
          size: 20.w,
          color: scheme.onSurface.withOpacity(0.5),
        ),
        selectedIconTheme: IconThemeData(
          size: 20.w,
          color: scheme.primary,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          minimumSize: MaterialStateProperty.all(Size.zero),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        isCollapsed: true,
        isDense: true,
        filled: true,
        fillColor: scheme.surface,
        labelStyle: TextStyle(
          fontSize: 16.w,
          color: scheme.onBackground,
          fontWeight: FontWeight.w600,
        ),
        hintStyle: TextStyle(color: scheme.onTertiary),
        helperStyle: TextStyle(
          fontSize: 14.w,
          color: scheme.onBackground.withOpacity(0.7),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 14.w,
          vertical: 12.w,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: scheme.outline, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10.w)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: scheme.outline, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10.w)),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: scheme.outline, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10.w)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: scheme.primary, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10.w)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: error, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10.w)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: error, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10.w)),
        ),
      ),
      tabBarTheme: TabBarTheme(
        labelColor: scheme.onBackground,
        unselectedLabelColor: scheme.onBackground.withOpacity(0.5),
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: scheme.primary,
        labelStyle: TextStyle(
          fontSize: 16.w,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 16.w,
          fontWeight: FontWeight.w600,
        ),
      ),
      dividerColor: scheme.outline,
      dividerTheme: DividerThemeData(
        thickness: 0.5.w,
        color: scheme.outline,
      ),
      popupMenuTheme: PopupMenuThemeData(
        elevation: 4,
        color: scheme.surface,
        textStyle: TextStyle(
          fontSize: 14.w,
          color: scheme.onSurface.withOpacity(0.8),
          height: 1.2,
        ),
        position: PopupMenuPosition.over,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.w),
        ),
      ),
    );
  }
}
