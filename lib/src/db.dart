import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

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

class StudentDartFB {
  Map<String, List<String>> studenFB = {};

  Future<void> fetchStudents() async {
    QuerySnapshot querySnapshot =
        (await FirebaseFirestore.instance.collection('student').doc("studentId").get()) as QuerySnapshot<Object?>;

    // ลูปผ่านเอกสารที่ได้มา
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      // ดึงค่าแต่ละฟิลด์จากเอกสาร
      String id = data['student_id'] ?? '';
      String name = data['name'] ?? '';
      String subject = data['subject'] ?? '';
      String img = data['img'] ?? '';

      // ใส่ข้อมูลในรูปแบบ Map<String, List<String>>
      studenFB[id] = [id, name, subject, img];
    }
  }
}
