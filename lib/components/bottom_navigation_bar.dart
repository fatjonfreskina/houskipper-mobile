import 'package:app/utilities/ui_constants.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;
  const BottomNavBar({super.key, required this.pageIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: kColorBluePrimary,
      elevation: 0,
      child: ClipRect(
        child: Row(
          children: [
            navItem(Icons.home_outlined, pageIndex == 0,
                onTap: () => onTap(0), pageName: 'Home'),
            navItem(Icons.account_balance_outlined, pageIndex == 1,
                onTap: () => onTap(1), pageName: 'House'),
            navItem(Icons.satellite_alt_outlined, pageIndex == 2,
                onTap: () => onTap(2), pageName: 'Statistics'),
            navItem(Icons.settings_outlined, pageIndex == 3,
                onTap: () => onTap(3), pageName: 'Settings'),
          ],
        ),
      ),
    );
  }

  Widget navItem(IconData icon, bool selected,
      {Function()? onTap, required String pageName}) {
    return Expanded(
        child: InkWell(
            onTap: onTap,
            child: Column(
              children: [
                Icon(
                  icon,
                  color:
                      selected ? Colors.white : Colors.white.withOpacity(0.4),
                ),
                Text(pageName)
              ],
            )));
  }
}
