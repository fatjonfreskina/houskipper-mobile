import 'package:app/components/large_text_button.dart';
import 'package:app/models/user_model.dart';
import 'package:app/services/state/prefs_service.dart';
import 'package:app/utilities/route_names.dart';
import 'package:app/utilities/ui_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// TODO: Create card (take it from the tutorial project), Miller's law
// TODO: Create navbar bottom

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User user = User(id: 0, email: '', firstName: '', lastName: '');

  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      user = PrefsManager().loadUser(prefs);
    });
  }

  @override
  initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Hi ${user.firstName}'),
            LargeTextButton(
              text: 'Logout',
              onPress: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                PrefsManager().clearPrefs(prefs);
                if (kDebugMode) {
                  print('Removed preferences');
                  PrefsManager().printPrefs(prefs);
                }
                Navigator.pushReplacementNamed(context, kRouteLoginPageName);
              },
              color: kColorAlertError,
            ),
          ],
        ),
      ),
    );
  }
}
