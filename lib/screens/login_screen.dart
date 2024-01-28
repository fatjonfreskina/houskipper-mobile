import 'package:app/components/large_text_button.dart';
import 'package:app/components/short_input_text.dart';
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
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Text(
              "Login",
              style: kTitleTextStyle,
            ),
            const SizedBox(height: 30),
            ShortInputText(
              hintText: 'username',
              controller: usernameController,
            ),
            const SizedBox(height: 20),
            ShortInputText(
              hintText: 'password',
              controller: passwordController,
            ),
            const SizedBox(height: 20),
            LargeTextButton(
                color: kColorBluePrimary,
                text: 'Login',
                onPress: () async {
                  ApiResponse<http.Response> response = await UserApiClient()
                      .login(usernameController.text, passwordController.text);
                  if (response.success) {
                    print("Login successful");
                    User user = response.data;
                    print("Got user: $user");
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    PrefsManager().setUserPrefs(prefs, user);
                    var jwt = user.jwt;
                    if (jwt != null) {
                      prefs.setString(kPrefJwt, jwt);
                      print("Set jwt to: $jwt");
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacementNamed(
                          context, kRouteHomePageName);
                    }
                  } else {
                    serverMessage = response.errorMessage;
                    print("Login not successful: $serverMessage");
                  }
                }),
            const SizedBox(height: 30),
            const Text(
              "Not a member?",
              style: kBodyTextStyle,
            ),
            const SizedBox(height: 20),
            LargeTextButton(
                color: kColorGreySecondary, text: 'Register', onPress: () {})
          ],
        ),
      ),
    );
  }
}
