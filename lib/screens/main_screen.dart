import 'package:app/components/bottom_navigation_bar.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/screens/house_screen.dart';
import 'package:app/screens/settings_screen.dart';
import 'package:app/screens/stats_screen.dart';
import 'package:flutter/material.dart';

import '../components/nav_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final homeNavKey = GlobalKey<NavigatorState>();
  final houseNavKey = GlobalKey<NavigatorState>();
  final statsNavKey = GlobalKey<NavigatorState>();
  final settingsNavKey = GlobalKey<NavigatorState>();
  int selectedTab = 0;
  List<NavModel> items = [];

  @override
  void initState() {
    super.initState();
    items = [
      NavModel(page: const HomeScreen(), navKey: homeNavKey),
      NavModel(page: const HouseScreen(tab: 2), navKey: houseNavKey),
      NavModel(page: const StatsScreen(tab: 3), navKey: statsNavKey),
      NavModel(page: const SettingsScreen(tab: 4), navKey: settingsNavKey)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (bool result) {
        if (items[selectedTab].navKey.currentState?.canPop() ?? false) {
          items[selectedTab].navKey.currentState?.pop();
        }
      },
      child: Scaffold(
        bottomNavigationBar: BottomNavBar(
          pageIndex: selectedTab,
          onTap: (index) {
            if (index == selectedTab) {
              items[index]
                  .navKey
                  .currentState
                  ?.popUntil((route) => route.isFirst);
            } else {
              setState(() {
                selectedTab = index;
              });
            }
          },
        ),
        body: IndexedStack(
          index: selectedTab,
          children: items
              .map((page) => Navigator(
                    key: page.navKey,
                    onGenerateInitialRoutes: (navigator, initialRoute) {
                      return [
                        MaterialPageRoute(builder: (context) => page.page)
                      ];
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }
}
