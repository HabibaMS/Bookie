
import 'package:bookie_v2/models/Users_Books_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const String UsersCollectionRef = "Users";
class DatabaseService {

  final database = FirebaseFirestore.instance;
  late final CollectionReference UsersRef;

  DatabaseService(){
    UsersRef = database.collection(UsersCollectionRef).withConverter<Users>(
        fromFirestore: (snapshots, _) => Users.fromMap(
          snapshots.data()!,
        ),
        toFirestore: (Users, _) => Users.toMap());
  }

  Stream<QuerySnapshot> getUsers() {
    return UsersRef.snapshots();
  }

  void addUser (Users users)async{
    UsersRef.add(users);
  }
}
