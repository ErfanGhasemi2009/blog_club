import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String fontFamilyDefualt = "Avenir";
  static const Color primaryTextColor = Color(0xff0D253C);
  static const Color secondryTextColor = Color(0xff2D4379);
  static const Color primaryColor = Color(0xff376AED);

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog Club',
      theme: ThemeData(
        textButtonTheme: const TextButtonThemeData(
            style: ButtonStyle(
                textStyle: WidgetStatePropertyAll(
          TextStyle(
              fontFamily: fontFamilyDefualt,
              color: primaryColor,
              fontWeight: FontWeight.w400,
              fontSize: 14),
        ))),
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
          onPrimary: Colors.white,
          background: Color(0xffFbFCFF),
          surface: Colors.white,
          onSurface: primaryTextColor,
          onBackground: primaryTextColor,
        ),
        appBarTheme: AppBarTheme(
            color: Theme.of(context).colorScheme.surface,
            titleSpacing: 32,
            foregroundColor: Theme.of(context).colorScheme.onBackground),
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: primaryColor,
        ),
        useMaterial3: false,
        textTheme: const TextTheme(
            bodyLarge: TextStyle(
                fontFamily: fontFamilyDefualt,
                color: secondryTextColor,
                fontWeight: FontWeight.w700,
                fontSize: 18),
            bodyMedium: TextStyle(
                color: secondryTextColor,
                fontFamily: fontFamilyDefualt,
                fontSize: 14),
            titleSmall: TextStyle(
                fontFamily: fontFamilyDefualt,
                color: secondryTextColor,
                fontWeight: FontWeight.w200,
                fontSize: 18),
            headlineLarge: TextStyle(
                color: primaryTextColor,
                fontFamily: fontFamilyDefualt,
                fontSize: 24,
                fontWeight: FontWeight.bold),
            bodySmall: TextStyle(
                color: secondryTextColor,
                fontFamily: fontFamilyDefualt,
                fontSize: 12),
            labelSmall: TextStyle(
                fontFamily: fontFamilyDefualt,
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700),
            headlineMedium: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: primaryTextColor,
                fontFamily: fontFamilyDefualt),
            titleMedium: TextStyle(
                fontFamily: fontFamilyDefualt,
                color: primaryTextColor,
                fontWeight: FontWeight.w400,
                fontSize: 14),
            displaySmall: TextStyle(
                fontFamily: fontFamilyDefualt,
                fontWeight: FontWeight.w700,
                fontSize: 10,
                color: secondryTextColor)),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
