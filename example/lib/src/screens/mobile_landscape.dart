import 'package:flutter/material.dart';

class MobileLandscape extends StatelessWidget {
  const MobileLandscape({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Mobile Landscape',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
