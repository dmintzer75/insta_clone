import 'package:flutter/material.dart';

class TabletScreenLayout extends StatelessWidget {
  const TabletScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tablet Screen'),
      ),
      body: const Center(
        child: Text('Tablet Screen'),
      ),
    );
  }
}
