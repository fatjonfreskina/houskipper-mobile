import 'package:app/utilities/route_names.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 58,
      child: PopupMenuButton(
          icon: const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg'),
            backgroundColor: Colors.red,
          ),
          itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem<String>(
                value: kRouteProfilePageName,
                child: Row(children: [
                  Icon(Icons.account_circle),
                  SizedBox(width: 10),
                  Text('Profile'),
                ]),
              ),
              const PopupMenuItem<String>(
                value: '2',
                child: Row(children: [
                  Icon(Icons.settings),
                  SizedBox(width: 10),
                  Text('Settings'),
                ]),
              ),
            ];
          },
          onSelected: (value) => {
                Navigator.pushNamed(context, value),
              }),
    );
  }
}
