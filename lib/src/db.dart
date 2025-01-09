import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

class UserDB {
  String email;
  String password;

  UserDB({required this.email, required this.password});
}