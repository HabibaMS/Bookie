import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddUser extends StatelessWidget {
  final String UserName;
  final String UserEmail;
  AddUser(this.UserName, this.UserEmail);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference Users = FirebaseFirestore.instance.collection('Users');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return Users
          .add({
        'UserName': UserName,
        'UserEmail': UserEmail,

      })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return TextButton(
      onPressed: addUser,
      child: Text(
        "Add User",
      ),
    );
  }
}