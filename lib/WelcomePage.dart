import 'package:bookie_v2/HomePage.dart';
import 'package:bookie_v2/LoginPage.dart';
import 'package:bookie_v2/RegisterPage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});
  @override  State<WelcomePage> createState() => _WelcomePageState();
}
class _WelcomePageState extends State<WelcomePage> with SingleTickerProviderStateMixin {  @override
Widget build(BuildContext context) {
  return Scaffold(
  body: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [ Lottie.asset("assets/animations/girlbook.json"),
      const SizedBox(height: 20),
      Text("Welcome to Bookie!",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.purple[800],
          fontSize: 26,
        ),
      )
    ],
    ),
  ),floatingActionButton: FloatingActionButton(
    onPressed: () {
  Navigator.push(context,
    MaterialPageRoute(builder: (context) => LogInPage(),),
  );      },
  child: Icon(Icons.arrow_circle_right_rounded,
    size: 45,
    color: Colors.purple[400],

  ),
  ),
);}
}
