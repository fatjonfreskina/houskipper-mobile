import 'package:app/components/labeled_input_text.dart';
import 'package:app/components/large_text_button.dart';
import 'package:app/services/network/user_api.dart';
import 'package:app/services/state/prefs_constants.dart';
import 'package:app/utilities/route_names.dart';
import 'package:app/utilities/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';
import '../services/network/api_common.dart';
import '../services/state/prefs_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String username, password, serverMessage;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
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
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                'Login',
                style: kTitleTextStyle,
              ),
              const Divider(indent: 40, endIndent: 40),
              const SizedBox(height: 30),
              LabeledInputText(
                  controller: usernameController,
                  labelText: 'username',
                  obscureText: false),
              const SizedBox(height: 20),
              LabeledInputText(
                  controller: passwordController,
                  labelText: 'password',
                  obscureText: true),
              const SizedBox(height: 20),
              LargeTextButton(
                  color: kColorBluePrimary,
                  text: 'Login',
                  onPress: () async {
                    ApiResponse<http.Response> response = await UserApiClient()
                        .login(
                            usernameController.text, passwordController.text);
                    if (response.success) {
                      User user = response.data;
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await PrefsManager().setUserPrefs(prefs, user);
                      var jwt = user.jwt;
                      if (jwt != null) {
                        await prefs.setString(kPrefJwt, jwt);
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacementNamed(
                            context, kRouteHomePageName);
                      }
                    } else {
                      serverMessage = response.errorMessage;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(serverMessage),
                          duration: const Duration(
                              seconds: 2), // Set the duration here
                          behavior: SnackBarBehavior
                              .floating, // Set the behavior to floating
                        ),
                      );
                    }
                  }),
              const SizedBox(height: 30),
              const Text(
                'Not a memsber?',
                style: kHintTextStyle,
              ),
              LargeTextButton(
                  color: kColorGreySecondary,
                  text: 'Register',
                  onPress: () {
                    Navigator.pushNamed(context, kRouteRegisterPageName);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
