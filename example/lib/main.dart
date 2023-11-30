import 'package:adaptive_screen_orientation/adaptive_screen_orientation.dart';
import 'package:example/src/screens/desktop.dart';
import 'package:example/src/screens/mobile_landscape.dart';
import 'package:example/src/screens/mobile_portrait.dart';
import 'package:example/src/screens/tablet_landscape.dart';
import 'package:example/src/screens/tablet_portrait.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: AdaptiveScreenOrientation(
          useAvailableLayout: false,
          mobilePortrait: MobilePortrait(),
          mobileLandscape: MobileLandscape(),
          tabletPortrait: TabletPortrait(),
          tabletLandscape: TabletLandscape(),
          desktop: Desktop(),
        ),
      ),
    );
  }
}
