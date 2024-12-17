import 'package:bookie_v2/HomePage.dart';
import 'package:bookie_v2/LoginPage.dart';
import 'package:bookie_v2/models/Users_Books_model.dart';
import 'package:bookie_v2/services/auth_service.dart';
import 'package:bookie_v2/services/cloud_firestore_service.dart';
import 'package:flutter/material.dart';


class RegisterPage  extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _passwordVisible = false;
  final DatabaseService db = DatabaseService();
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
            Text("Hello!",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.black
              ), textAlign: TextAlign.center,
            ),
            Text("Welcome to Bookie!",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,

                  color: Colors.black
              ), textAlign: TextAlign.center,
            ),
            SizedBox(height: 7,),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextFormField(
                controller : nameController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.account_box, color: Colors.deepPurple,),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(3.0),
              child: TextFormField(
                controller : emailController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email, color: Colors.deepPurple,),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextFormField(
                controller : passwordController,
                maxLength: 11,
                //keyboardType: TextInputType.visiblePassword,
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

            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                width: double.infinity,
                height: 60,
                child:
                FilledButton(
                  onPressed: ()
                  async{
                    AuthService().signup(
                        email: emailController.text,
                        password: passwordController.text,
                        context: context);
                    Users users = Users(UserName: nameController.text, UserEmail: emailController.text);
                    db.addUser(users);
                  },
                  child:
                  Text("Register",),



                ),
              ),
            ),
            SizedBox(height: 3,),
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
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(child: Image(
                  image: AssetImage("assets/Google.jpg"),
                  width: 35,
                  height: 35,)),
                Container(child: Image(
                  image: AssetImage("assets/Apple.jpg"),
                  width: 35,
                  height: 35,)),
                Container(child: Image(
                  image: AssetImage("assets/Facebook.jpg"),
                  width: 35,
                  height: 35,)),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? ", style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
                ),
                
                InkWell(
                  onTap: () {
                    Navigator.push(context,  MaterialPageRoute(builder: (context) => LogInPage(),));
                    
                  },
                  child: Text("Login now", style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.deepPurple,),
                  ),
                ),
              ],
            ),
          ],
        )
    );
  }
}
