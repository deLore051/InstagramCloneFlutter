import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/Screens/login_screen.dart';
import 'package:instagram_clone/Screens/singup_screen.dart';
import './Resources/colors.dart';
import './Responsive/mobile_screen_layout.dart';
import './Responsive/web_screen_layout.dart';
import 'Responsive/responsive_layout_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  kIsWeb 
    ? await Firebase.initializeApp(
        options: FirebaseOptions(
          apiKey: "AIzaSyC161VtLuhrCFj72nyiVP6GYAs8SWMOUFs", 
          appId: "1:238514295202:web:1b0ee36b6c424236b9a2fb", 
          messagingSenderId: "238514295202", 
          projectId: "instagram-clone-app-flutter",
          authDomain: "instagram-clone-app-flutter.firebaseapp.com",
          measurementId: "G-TRY99G22HR",
          storageBucket: "instagram-clone-app-flutter.appspot.com",
        )
    ) 
    : await Firebase.initializeApp();
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
          ),
        ),
      ),
      // home: const ResponsiveLayout(
      //   webScreemLayout: WebScreenLayout(), 
      //   mobileScreenLayout: MobileScreenLayout(),
      // ),
      home: SignUpScreen()
    );
  }
}

