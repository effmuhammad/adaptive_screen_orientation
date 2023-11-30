import 'package:flutter/material.dart';

class TabletPortrait extends StatelessWidget {
  const TabletPortrait({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Tablet Portrait',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
