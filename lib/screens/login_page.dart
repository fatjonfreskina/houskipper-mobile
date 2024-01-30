import 'package:app/components/large_text_button.dart';
import 'package:app/components/short_input_text.dart';
import 'package:app/services/network/user_api.dart';
import 'package:app/services/state/prefs_constants.dart';
import 'package:app/utilities/route_names.dart';
import 'package:app/utilities/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';
import '../services/state/prefs_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late PrefsManager prefs;
  late String username, password, serverMessage;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    prefs = PrefsManager();
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
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
                  var response = await UserApiClient()
                      .login(usernameController.text, passwordController.text);
                  if (response.success) {
                    User user = response.data;
                    var jwt = user.jwt;
                    if (jwt != null) {
                      var prefs = await SharedPreferences.getInstance();
                      prefs.setString(kPrefJwt, jwt);
                      if (!context.mounted) return;
                      Navigator.pushReplacementNamed(
                          context, kRouteHomePageName);
                    }
                  } else {
                    serverMessage = response.errorMessage;
                  }
                }),
            const SizedBox(height: 30),
            const Text(
              "Not a member?",
              style: kBodyTextStyle,
            ),
            const SizedBox(height: 20),
            LargeTextButton(
                color: kColorGreySecondary,
                text: 'Register',
                onPress: () {
                  // To do
                  // Navigator.pushNamed(context, kRouteRegisterPageName);
                }),
          ],
        ),
      ),
    );
  }
}
