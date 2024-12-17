import 'package:bookie_v2/BookDescription.dart';
import 'package:bookie_v2/CartPage.dart';
import 'package:bookie_v2/models/cart_model.dart';
import 'package:bookie_v2/HomePage.dart';
import 'package:bookie_v2/LoginPage.dart';
import 'package:bookie_v2/Notification.dart';
import 'package:bookie_v2/RegisterPage.dart';
import 'package:bookie_v2/WelcomePage.dart';
import 'package:bookie_v2/paymentPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bookie_v2/cart_provider.dart';
import 'package:provider/provider.dart';

  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseFirestore.instance.settings = const Settings(
      persistenceEnabled: true,
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
    return ChangeNotifierProvider(
        create: (_) => CartProvider(),
    child: Builder(builder: (BuildContext context){

    return MaterialApp(
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
       //home: WelcomePage(),
      //home: RegisterPage(),
      //home: LogInPage(),
       //ghome: HomePage(),
      //home: NotificationPage(),
      //home: Bookdescription(),
      //home: CartPage(),
      //home: PaymentPage(),
      //home: MyCartPage(),
    );
    }),
    );
  }
}

