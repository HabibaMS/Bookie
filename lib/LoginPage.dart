import 'package:bookie_v2/HomePage.dart';
import 'package:bookie_v2/RegisterPage.dart';
import 'package:bookie_v2/services/auth_service.dart';
import 'package:bookie_v2/services/cloud_firestore_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LogInPage  extends StatefulWidget {
  const LogInPage({super.key});
  @override
  State<LogInPage> createState() => _LogInPageState();
}


class _LogInPageState extends State<LogInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _passwordVisible = false;
  @override
  void initState() {
    _passwordVisible = false;
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Hello Again!",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Colors.black
            ), textAlign: TextAlign.center,
          ),
          Text("Welcome back, you've been missed!",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black
            ), textAlign: TextAlign.center,
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller : emailController,
              //ex: p1@gmail.com
              //ex: p2@gmail.com
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email,color: Colors.deepPurple,),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextFormField(
              controller : passwordController,
              //ex: p1.testpass
              //ex: p2.testpass
              //ex: habiba123
              maxLength: 11,
              obscureText: !_passwordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock, color: Colors.deepPurple,),
                suffixIcon: IconButton(
                  icon: Icon(
                      _passwordVisible
                          ? Icons.visibility_off
                          : Icons.visibility),
                  onPressed: () => setState(() {
                    _passwordVisible = !_passwordVisible;
                  }),
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 60,
              child: FilledButton(
                onPressed: () async{
                  await AuthService().signin(
                      email: emailController.text,
                      password: passwordController.text,
                      context: context );
                  },
                  child: Text("Login"),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Row(children: <Widget>[
            Expanded(
              child: new Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                  child: Divider(
                    color: Colors.black,
                    height: 36,
                  )),
            ),
            Text("Or Continue with"),
            Expanded(
              child: new Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                  child: Divider(
                    color: Colors.black,
                    height: 36,
                  )),
            ),
          ]),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon:
              Image(image: AssetImage("assets/Google.jpg"), width: 50, height: 50,),
              onPressed: (){},),
              Image(image: AssetImage("assets/Apple.jpg"), width: 50, height: 50,),
              Image(image: AssetImage("assets/Facebook.jpg"), width: 50, height: 50,),
            ],
          ),
          SizedBox(height: 40,),
          Row(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Not a member? ", style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
              ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,  MaterialPageRoute(builder: (context) => RegisterPage(),));
                  },
                child: Text("Register now", style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.deepPurple),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


