import 'package:bookie_v2/BookDescription.dart';
import 'package:bookie_v2/HomePage.dart';
import 'package:bookie_v2/LoginPage.dart';
import 'package:bookie_v2/Notification.dart';
import 'package:bookie_v2/RegisterPage.dart';
import 'package:bookie_v2/WelcomePage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';


  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  runApp(const MyApp());
}

class DefaultFirebaseOptions {
  static var currentPlatform;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
       //home: WelcomePage(),
      // home: Bookdescription(),
      //home: RegisterPage(),
      home: LogInPage(),
      //home: HomePage(),
      //home: NotificationPage(),
    );
  }
}

