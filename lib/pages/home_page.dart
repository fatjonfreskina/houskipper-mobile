import 'package:app/components/navigation_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const MyNavigationDrawer(),
      body: Center(
        child: Column(
          children: [Text('Hello from home page')],
        ),
      ),
    );
  }
}
