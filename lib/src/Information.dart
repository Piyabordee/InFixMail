import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inmailfix/src/db.dart';
import 'package:url_launcher/url_launcher.dart';

class Information extends StatelessWidget {
  const Information({super.key});

  void _openLineChat() async {
    final Uri url = Uri.parse(
        'https://line.me/R/ti/p/@291utbzk'); // ลิงก์ Line ที่ต้องการเปิด
    if (await canLaunchUrl(url)) {
      await launchUrl(url); // ใช้โหมดแอปภายนอก
    } else {
      throw 'ไม่สามารถเปิด URL นี้ได้: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                        backgroundColor: const Color.fromRGBO(116, 205, 139, 1),
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
                        backgroundColor: const Color.fromRGBO(116, 205, 139, 1),
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
                        backgroundColor: const Color.fromRGBO(116, 205, 139, 1),
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

    db = FirebaseFirestore.instance;

    String datasync(int code) {
      return StudentDart().studen["52626"]![code];
    }

    // String datasync = "52626"; // ใส่รหัสนักศึกษาที่ต้องการดูข้อมูล
    // final String datasync = ModalRoute.of(context)!.settings.arguments as String; // ใช้สำหรับการส่งค่าระหว่างหน้าตรวจสอบว่ามีค่า arguments ถูกส่งมาหรือไม่
    // final routeArgs = ModalRoute.of(context)?.settings.arguments;

    // // ตรวจสอบว่า arguments เป็น String หรือไม่
    // if (routeArgs is String) {
    //   final String datasync = routeArgs;
    //   // ใช้ datasync ตามที่ต้องการ
    // } else {
    //   // กรณีที่ไม่มีค่า arguments หรือไม่ใช่ String
    //   final String datasync =
    //       'default_value'; // หรือค่าที่ต้องการใช้เป็นค่าเริ่มต้น
    //   // ใช้ datasync ตามที่ต้องการ
    // }
    return Row(
      children: [
        Image.network(
          datasync(3),
          // StudentDartFB().studenFB["52626"]![3],
          width: 130,
          height: 130,
        ),
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
                  "รหัสนักศึกษา ${datasync(0)}\nชื่อ ${datasync(1)}\nสาขา ${datasync(2)}",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kanit(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
                // ,
                // Text(
                //   "ชื่อ ${StudentDart().studen[datasync]![1]}",
                //   style: GoogleFonts.kanit(
                //       fontSize: 18, fontWeight: FontWeight.bold),
                // ),
                // Text(
                //   "สาขา ${StudentDart().studen[datasync]![2]}",
                //   style: GoogleFonts.kanit(
                //       fontSize: 16, fontWeight: FontWeight.bold),
                // )
              ],
            ),
          ),
        ),
      ],
    );
  }
}