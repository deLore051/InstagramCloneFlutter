import 'package:flutter/material.dart';
import './Resources/colors.dart';
import './Responsive/mobile_screen_layout.dart';
import './Responsive/web_screen_layout.dart';
import 'Responsive/responsive_layout_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
          )
        ),
      ),
      home: const ResponsiveLayout(
        webScreemLayout: WebScreenLayout(), 
        mobileScreenLayout: MobileScreenLayout(),
      ),
    );
  }
}

