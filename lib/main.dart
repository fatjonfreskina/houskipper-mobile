import 'package:app/screens/home_screen.dart';
import 'package:app/screens/login_screen.dart';
import 'package:app/screens/main_screen.dart';
import 'package:app/screens/splash_screen.dart';
import 'package:app/utilities/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:app/utilities/route_names.dart';
import 'package:flutter/services.dart';
import 'dart:io';

// TODO: splash screen
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    HttpOverrides.global = MyHttpOverrides();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
          primaryColor: kColorBluePrimary,
          primaryColorDark: kColorBluePrimary,
          scaffoldBackgroundColor: kColorGreyPrimary,
          appBarTheme: const AppBarTheme(backgroundColor: kColorBluePrimary)),
      routes: {
        kRouteMainPageName: (context) => const MainScreen(),
        kRouteLoginPageName: (context) => const LoginScreen(),
        kRouteHomePageName: (context) => HomeScreen()
      },
      home: const SplashScreen(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
