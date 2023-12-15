import 'package:flutter/material.dart';
import 'package:insta_clone/providers/user_provider.dart';
import 'package:insta_clone/utils/global_variables.dart';
import 'package:provider/provider.dart';

class ResponsiveLayout extends StatefulWidget {
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
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);
    await userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < maxMobileScreenSize) {
          // Mobile layout
          return widget.mobileScreenLayout;
        } else if (constraints.maxWidth < maxTabletScreenSize) {
          // Tablet layout
          return widget.tabletScreenLayout;
        } else {
          // Desktop layout
          return widget.webScreenLayout;
        }
      },
    );
  }
}
