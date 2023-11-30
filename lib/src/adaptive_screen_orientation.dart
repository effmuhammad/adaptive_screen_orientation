import 'package:flutter/material.dart';

class AdaptiveScreenOrientation extends StatelessWidget {
  const AdaptiveScreenOrientation({
    super.key,
    this.useAvailableLayout = true,
    this.mobilePortrait,
    this.mobileLandscape,
    this.tabletPortrait,
    this.tabletLandscape,
    this.desktop,
    this.tabletBreakpoint = 768,
    this.desktopBreakpoint = 1280,
  });

  /// If true, will use the available layout instead of the specified layout.
  final bool useAvailableLayout;
  final Widget? mobilePortrait;
  final Widget? mobileLandscape;
  final Widget? tabletPortrait;
  final Widget? tabletLandscape;
  final Widget? desktop;
  final double tabletBreakpoint;
  final double desktopBreakpoint;

  Widget notSpecified(String layout) {
    return Center(
      child: Text(
        '$layout layout not specified',
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget mobilePortraitNotSpecified() {
    return useAvailableLayout
        ? mobileLandscape ??
            tabletPortrait ??
            tabletLandscape ??
            desktop ??
            notSpecified('Any')
        : notSpecified('Mobile Portrait');
  }

  Widget mobileLandscapeNotSpecified() {
    return useAvailableLayout
        ? tabletPortrait ??
            tabletLandscape ??
            desktop ??
            mobilePortrait ??
            notSpecified('Any')
        : notSpecified('Mobile Landscape');
  }

  Widget tabletPortraitNotSpecified() {
    return useAvailableLayout
        ? mobileLandscape ??
            mobilePortrait ??
            tabletLandscape ??
            desktop ??
            notSpecified('Any')
        : notSpecified('Tablet Portrait');
  }

  Widget tabletLandscapeNotSpecified() {
    return useAvailableLayout
        ? desktop ??
            mobileLandscape ??
            tabletPortrait ??
            mobilePortrait ??
            notSpecified('Any')
        : notSpecified('Tablet Landscape');
  }

  Widget desktopNotSpecified() {
    return useAvailableLayout
        ? tabletLandscape ??
            mobileLandscape ??
            tabletPortrait ??
            mobilePortrait ??
            notSpecified('Any')
        : notSpecified('Desktop');
  }

  @override
  Widget build(BuildContext context) {
    // combination of OrientationBuilder and LayoutBuilder
    return OrientationBuilder(
      builder: (context, orientation) {
        return LayoutBuilder(
          builder: (context, constraints) {
            // in portrait
            if (orientation == Orientation.portrait) {
              if (constraints.maxWidth < tabletBreakpoint) {
                return mobilePortrait ?? mobilePortraitNotSpecified();
              } else if (constraints.maxWidth < desktopBreakpoint) {
                return tabletPortrait ?? tabletPortraitNotSpecified();
              } else {
                return desktop ?? desktopNotSpecified();
              }
            }
            // in landscape
            else {
              if (constraints.maxHeight < tabletBreakpoint) {
                return mobileLandscape ?? mobileLandscapeNotSpecified();
              } else if (constraints.maxWidth < desktopBreakpoint) {
                return tabletLandscape ?? tabletLandscapeNotSpecified();
              } else {
                return desktop ?? desktopNotSpecified();
              }
            }
          },
        );
      },
    );
  }
}
