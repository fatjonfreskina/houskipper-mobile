import 'package:app/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 2,
        pageContext: context,
      ),
      appBar: AppBar(
        title: const Text('Stats'),
      ),
      body: const Text('Hello from stats page'),
    );
  }
}
