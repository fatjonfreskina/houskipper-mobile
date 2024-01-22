import 'package:app/utilities/route_names.dart';
import 'package:flutter/material.dart';

import '../pages/main_page.dart';

class MyNavigationDrawer extends StatelessWidget {
  const MyNavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );

  Widget buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
      );

  Widget buildMenuItems(BuildContext context) => Wrap(
        runSpacing: 10,
        children: [
          ListTile(
            leading: const Icon(
              Icons.home_outlined,
            ),
            title: const Text('Home'),
            onTap: () {
              // Check if the current page is not the one you want to navigate to
              Navigator.pushNamed(context, kRouteHomePageName);
            },
          ),
        ],
      );
}
