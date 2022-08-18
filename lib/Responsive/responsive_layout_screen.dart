import 'package:flutter/material.dart';
import '../Resources/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webScreemLayout;
  final Widget mobileScreenLayout;

  const ResponsiveLayout({
    super.key, 
    required this.webScreemLayout, 
    required this.mobileScreenLayout
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if(constraints.maxWidth > webScreenSize) {
          return webScreemLayout;
        }
        return mobileScreenLayout;
    });
  }
}