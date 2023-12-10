import 'package:flutter/material.dart';
import 'package:insta_clone/utils/device_dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.webScreenLayout,
    required this.mobileScreenLayout,
    required this.tabletScreenLayout,
  });
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  final Widget tabletScreenLayout;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < maxMobileScreenSize) {
          // Mobile layout
          return mobileScreenLayout;
        } else if (constraints.maxWidth < maxTabletScreenSize) {
          // Tablet layout
          return tabletScreenLayout;
        } else {
          // Desktop layout
          return webScreenLayout;
        }
      },
    );
  }
}
