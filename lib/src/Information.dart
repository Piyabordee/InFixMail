import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class StudentProvider with ChangeNotifier {
  String _name = '';
  String _img = '';
  String _student_id = '';
  String _subject = '';

  String get name => _name;
  String get img => _img;
  String get student_id => _student_id;
  String get subject => _subject;

  Future<void> fetchStudent(String studentId) async {
    final studentDoc =
        FirebaseFirestore.instance.collection('student').doc(studentId);
    final docSnapshot = await studentDoc.get();
    _name = docSnapshot['name'];
    _img = docSnapshot['img'];
    _student_id = docSnapshot['student_id'];
    _subject = docSnapshot['subject'];
    notifyListeners();
  }
}

class Information extends StatelessWidget {
  final String userId;
  const Information({super.key, required this.userId});

  void _openLineChat() async {
    final Uri url = Uri.parse(
        'https://line.me/R/ti/p/@291utbzk'); // ลิงก์ Line ที่ต้องการเปิด
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StudentProvider()..fetchStudent(userId),
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: const Color.fromARGB(255, 138, 138, 138),
            titleTextStyle: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("InMailFix"),
          ),
          body: Container(
            width: double.infinity,
            color: const Color.fromARGB(255, 138, 138, 138),
            child: Column(
              children: [
                Container(
                  width: 360,
                  height: 217,
                  decoration: ShapeDecoration(
                    color: const Color.fromRGBO(97, 148, 193, 1),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 0.50, color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [InformationDATA()],
                  ),
                ),
                const SizedBox(
                  height: 23,
                ),
                Container(
                  width: 360,
                  height: 107,
                  decoration: ShapeDecoration(
                    color: const Color.fromRGBO(97, 148, 193, 1),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 0.50, color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          _openLineChat();
                        },
                        style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(116, 205, 139, 1),
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(25),
                        ),
                        child: Text(
                          "แจ้งขอเปลี่ยน\nรหัสผ่าน Gmail",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.kanit(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _openLineChat();
                        },
                        style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(116, 205, 139, 1),
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(30),
                        ),
                        child: Text(
                          "เข้า Gmail ไม่ได้",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.kanit(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _openLineChat();
                        },
                        style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(116, 205, 139, 1),
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(25),
                        ),
                        child: Text(
                          "IOS เข้า Gmail\nไม่ได้",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.kanit(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InformationDATA extends StatefulWidget {
  const InformationDATA({super.key});

  @override
  State<InformationDATA> createState() => _InformationDATAState();
}

class _InformationDATAState extends State<InformationDATA> {
  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<StudentProvider>(context);

    return Row(
      children: [
        studentProvider.img.isNotEmpty
            ? Image.network(
                studentProvider.img,
                width: 130,
                height: 130,
              )
            : const CircularProgressIndicator(),
        const SizedBox(
          width: 10,
        ),
        Container(
          width: 195,
          height: 151,
          decoration: ShapeDecoration(
              color: const Color.fromRGBO(217, 217, 217, 1),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 0.50, color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              )),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Stack(),
                Text(
                  "รหัสนักศึกษา ${studentProvider.student_id}\nชื่อ ${studentProvider.name}\nสาขา ${studentProvider.subject}",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kanit(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
