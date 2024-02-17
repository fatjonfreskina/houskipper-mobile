import 'package:app/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 3,
        pageContext: context,
      ),
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Text('Hello from profile page'),
    );
  }
}
