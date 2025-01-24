import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'login.dart';

class StudentProvider with ChangeNotifier {
  String _name = '';
  String _img = '';
  String _student_id = '';
  String _subject = '';

  String get name => _name;
  String get img => _img;
  String get student_id => _student_id;
  String get subject => _subject; // สำหรับการดึงข้อมูลนักศึกษา

  bool _isLoading = false;
  bool get isLoading => _isLoading; // สำหรับตรวจสอบว่ากำลังโหลดหรือไม่

  Future<void> fetchStudent(String studentId) async {
    _isLoading = true;
    notifyListeners();
    try {
      final studentDoc =
          FirebaseFirestore.instance.collection('student').doc(studentId);
      final docSnapshot = await studentDoc.get();
      if (docSnapshot.exists) {
        _name = docSnapshot['name'] ?? '';
        _img = docSnapshot['img'] ?? '';
        _student_id = docSnapshot['student_id'] ?? '';
        _subject = docSnapshot['subject'] ?? '';
      } else {
        throw Exception("ไม่พบข้อมูลนักศึกษา");
      }
    } catch (e) {
      print("เกิดข้อผิดพลาดในการดึงข้อมูล(piyabordee): $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

const kPrimaryColor = Color.fromRGBO(97, 148, 193, 1);
const kSecondaryColor = Color.fromRGBO(116, 205, 139, 1);

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
              fontSize: 16.sp,
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
                  width: 320.w,
                  height: 190.h,
                  decoration: ShapeDecoration(
                    color: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.50.w, color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [InformationDATA()],
                  ),
                ),
                SizedBox(
                  height: 23.h,
                ),
                Container(
                  width: 320.w,
                  height: 80.h,
                  decoration: ShapeDecoration(
                    color: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.50.w, color: Colors.white),
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
                          backgroundColor: kSecondaryColor,
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(25),
                        ),
                        child: Text(
                          "แจ้งขอเปลี่ยน\nรหัสผ่าน Gmail",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.kanit(
                            color: Colors.black,
                            fontSize: 8.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _openLineChat();
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: kSecondaryColor,
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(30),
                        ),
                        child: Text(
                          "เข้า Gmail ไม่ได้",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.kanit(
                            color: Colors.black,
                            fontSize: 8.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _openLineChat();
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: kSecondaryColor,
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(25),
                        ),
                        child: Text(
                          "IOS เข้า Gmail\nไม่ได้",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.kanit(
                            color: Colors.black,
                            fontSize: 8.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 220),
                  child: TextButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut().then(
                        (value) async {
                          final prefs = await SharedPreferences.getInstance();
                          await prefs
                              .clear(); // ลบข้อมูลทั้งหมดใน SharedPreferences
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyApp(),
                            ),
                          );
                        },
                      );
                    },
                    style: TextButton.styleFrom(
                      alignment: Alignment.center,
                      side: const BorderSide(width: 1, color: Colors.white),
                      backgroundColor: kSecondaryColor,
                      padding: const EdgeInsets.all(25),
                    ),
                    child: Text(
                      "ออกจากระบบ",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.kanit(
                        color: Colors.black,
                        fontSize: 8.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
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
                width: 110.r,
                height: 110.r,
              )
            : const CircularProgressIndicator(),
        SizedBox(
          width: 10.w,
        ),
        Container(
          width: 160.w,
          height: 130.h,
          decoration: ShapeDecoration(
              color: const Color.fromRGBO(217, 217, 217, 1),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 0.50.w, color: Colors.white),
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
                    fontSize: 16.sp,
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
