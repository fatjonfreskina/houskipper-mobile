import 'package:app/components/avatar.dart';
import 'package:app/components/bottom_nav_bar.dart';
import 'package:app/components/icon_content.dart';
import 'package:app/components/reusable_card.dart';
import 'package:app/models/user_model.dart';
import 'package:app/services/state/prefs_service.dart';
import 'package:app/utilities/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// TODO: Style navbar bottom
// TODO: Add functionality to navbar

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
        actions: const [
          Avatar(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 1,
        pageContext: context,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Hello ${user.firstName} ${user.lastName}',
              style: kTitleTextStyle,
            ),
          ),
          const Divider(
            color: kColorGreySecondary,
            indent: 20,
            endIndent: 20,
          ),
          Row(
            children: [
              Expanded(
                child: ReusableCard(
                  color: Colors.transparent,
                  onPress: () {
                    debugPrint('Pressed');
                  },
                  cardChild: const IconContent(
                      icon: Icons.access_alarm_rounded, label: 'ciao'),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  color: Colors.transparent,
                  onPress: () {
                    debugPrint('Pressed');
                  },
                  cardChild: const IconContent(
                      icon: Icons.access_alarm_rounded, label: 'ciao'),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ReusableCard(
                  color: Colors.transparent,
                  onPress: () {
                    debugPrint('Pressed');
                  },
                  cardChild: const IconContent(
                    icon: Icons.person,
                    label: 'Profile',
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  color: Colors.transparent,
                  onPress: () {
                    debugPrint('Pressed');
                  },
                  cardChild: const IconContent(
                    icon: Icons.abc_sharp,
                    label: 'abs',
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ReusableCard(
                  color: Colors.transparent,
                  onPress: () {
                    debugPrint('Pressed');
                  },
                  cardChild: const IconContent(
                    icon: Icons.abc_sharp,
                    label: 'abs',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
