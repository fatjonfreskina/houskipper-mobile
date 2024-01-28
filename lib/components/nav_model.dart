import 'package:flutter/cupertino.dart';

class NavModel {
  Widget page;
  final GlobalKey<NavigatorState> navKey;

  NavModel({required this.page, required this.navKey});
}
