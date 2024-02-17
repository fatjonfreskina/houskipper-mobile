import 'package:app/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class HouseScreen extends StatelessWidget {
  const HouseScreen({super.key});

// TODO: If no house, move the user to another screen to create a house
// TODO: page layout is a set of reusable cards, if pressed move to the house
// details page

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 0,
        pageContext: context,
      ),
      appBar: AppBar(
        title: const Text('House'),
      ),
      body: const Text('Hello from house page'),
    );
  }
}
