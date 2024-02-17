import 'package:app/utilities/route_names.dart';
import 'package:app/utilities/ui_constants.dart';
import 'package:flutter/material.dart';

// TODO: new icons

class BottomNavBar extends StatelessWidget {
  const BottomNavBar(
      {super.key, required this.selectedIndex, required this.pageContext});
  final int selectedIndex;
  final BuildContext pageContext;

  void _onItemTapped(int index) {
    debugPrint('Index: $index');
    if (index == selectedIndex) {
      return;
    }

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(pageContext, kRouteHousePageName);
        break;
      case 1:
        Navigator.pushReplacementNamed(pageContext, kRouteHomePageName);
        break;
      case 2:
        Navigator.pushReplacementNamed(pageContext, kRouteStatsPageName);
        break;
      default:
        debugPrint('Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.dry_cleaning),
          label: 'House',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart_sharp),
          label: 'Stats',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.black,
      backgroundColor: kColorMenuBG,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
    );
  }
}
