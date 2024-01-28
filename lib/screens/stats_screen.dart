import 'package:flutter/cupertino.dart';

class StatsScreen extends StatefulWidget {
  final int tab;
  const StatsScreen({super.key, required this.tab});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Text('Hello from stats page');
  }
}
