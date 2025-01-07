import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future singIn(String studen, String password) async {
  try {
    await db.collection('student_id').doc().get();
  } catch (e) {
    print(e);
  }
}

class StudentDart {
  Map<String, List<String>> studen = {
    "52626": [
      "52626",
      "ปิยบดี",
      "เทคโนธุรกิจ",
      "https://img2.pic.in.th/pic/image1b3f8405219aa655.png"
    ],
    "51718": [
      "51718",
      "Jirayu",
      "เทคโนธุรกิจ",
      "https://img2.pic.in.th/pic/image9064b8f57a1cd9df.png"
    ],
    "51692": [
      "51692",
      "Nutchapon",
      "เทคโนธุรกิจ",
      "https://img2.pic.in.th/pic/image6c922a709082800d.png"
    ],
  };
}