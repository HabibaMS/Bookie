import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  final String UserName;
  final String UserEmail;

  Users({
    required this.UserName,
    required this.UserEmail,
  });

  Users.fromMap(Map<String, Object?> res)
  : UserName = res ["UserName"]! as String,
  UserEmail = res ["UserEmail"]! as String;

  Users copyWith({
    String? UserName,
    String? UserEmail,
}){
    return Users(UserName: UserName ?? this.UserName,
        UserEmail: UserEmail ?? this.UserEmail);
  }

  Map<String, Object?> toMap(){
    return {
      "UserName" : UserName,
      "UserEmail" : UserEmail,

    };
  }
}

class Books {
  final String title;
  final String author;
  final String description;
  final String imagePath;

  Books({
    required this.title,
    required this.author,
    required this.description,
    required this.imagePath,
  });
}
//Make a list of books, and get it's data from Firestore.