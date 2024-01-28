// ignore_for_file: avoid_print

import 'package:app/services/state/prefs_service.dart';
import 'package:app/services/state/prefs_constants.dart';
import 'package:app/utilities/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';
import '../services/network/api_common.dart';
import '../services/network/user_api.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late String jwt = '';

  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      jwt = prefs.getString(kPrefJwt) ?? '';
      print("Set the token");
    });
  }

  void validateToken(context, String token) async {
    print("Started test token");
    ApiResponse<http.Response> response =
        await UserApiClient().testToken(token);
    if (response.success) {
      // Todo set the user prefs
      Navigator.pushReplacementNamed(context, kRouteHomePageName);
    } else {
      Navigator.pushReplacementNamed(context, kRouteLoginPageName);
    }
  }

  @override
  void initState() {
    print('Started init');
    loadData();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (jwt == '') {
          print("Jwt is null");
        } else {
          print('Jwt is not null!');
          validateToken(context, jwt);
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue, Colors.purple])),
        child: const Center(
          child: Column(
            children: [
              Text('Splash screen'),
            ],
          ),
        ),
      ),
    );
  }
}
