import 'package:flutter/material.dart';

class HouseScreen extends StatelessWidget {
  final int tab;
  const HouseScreen({super.key, required this.tab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('House'),
      ),
      body: Text('Hello from house page'),
    );
  }
}
