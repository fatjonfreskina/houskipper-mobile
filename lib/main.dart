import 'package:app/pages/home_page.dart';
import 'package:app/pages/login_page.dart';
import 'package:app/pages/main_page.dart';
import 'package:app/utilities/route_names.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: kRouteMainPageName,
      routes: {
        kRouteMainPageName: (context) => const MainPage(),
        kRouteHomePageName: (context) => const HomePage(),
        kRouteLoginPageName: (context) => const LoginPage()
      },
    );
  }
}
