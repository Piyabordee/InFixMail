import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'information.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text(
                "InMailFix",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: const Color.fromARGB(255, 31, 31, 31),
            ),
            body: Container(
                width: double.infinity,
                color: const Color.fromARGB(255, 31, 31, 31),
                child: Column(children: [
                  Container(
                      width: 360,
                      height: 640,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF1F1F1F),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 0.50, color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Column(
                          mainAxisAlignment:
                              MainAxisAlignment.center, // จัดตำแหน่ง
                          children: [
                            Top(),
                            Login(),
                          ]))
                ]))));
  }
}

class Top extends StatelessWidget {
  const Top({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Row(
          mainAxisSize: MainAxisSize.min, // ทำให้ Row ใช้แค่พื้นที่ที่จำเป็น
          children: [
            Container(
              decoration: ShapeDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                      "assets/icon/icon.png"), // รูปภาพ
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              width: 90,
              height: 90,
            ),
            const SizedBox(
              width: 25,
            ),
            Column(
                mainAxisSize:
                    MainAxisSize.min, // ทำให้ Column ใช้แค่พื้นที่ที่จำเป็น
                children: [
                  Text(
                    "เข้าสู่ระบบ",
                    style: GoogleFonts.kanit(
                      color: const Color(0xFF7FD858),
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text('INMAILFIX',
                      style: GoogleFonts.kanit(
                          color: const Color(0xFFFF96D5),
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            const Shadow(
                              color: Color.fromARGB(255, 255, 2, 154),
                              blurRadius: 30,
                            )
                          ]))
                ])
          ])
    ]);
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}


class _LoginState extends State<Login> {
  bool isChecked = false; // ตัวแปรของ checkbox

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 80, 0, 10),
                child: Text("รหัสประจำตัว",
                    style: GoogleFonts.kanit(
                      color: Colors.white,
                      fontSize: 16,
                    )),
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
              child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: "ใส่รหัสประจำตัวของคุณ",
                      hintStyle: GoogleFonts.kanit(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(0, 0, 0, 0.3), // สีพื้นหลังใส
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))))
        ],
      ),
      Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 220, 0, 10),
                child: Text("รหัสผ่าน",
                    style: GoogleFonts.kanit(
                      color: Colors.white,
                      fontSize: 16,
                    )),
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
              child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: InputDecoration(
                    
                      hintText: "ใส่รหัสผ่านของคุณ",
                      hintStyle: GoogleFonts.kanit(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(0, 0, 0, 0.3), // สีพื้นหลังใส
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ))))
        ],
      ),
      Column(children: [
        Row(
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(10, 330, 0, 0),
                child: Checkbox(
                    value: isChecked, // ตัวแปรอยู่บรรทัด 114
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value ?? true;
                      });
                    })),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 331, 0, 0),
                child: Text('Rememebr me',
                    style: GoogleFonts.kanit(
                      fontSize: 16,
                      color: Colors.white,
                    )))
          ],
        ),
      ]),
      Center(
          child: Padding(
              padding: const EdgeInsets.only(top: 390),
              child: Container(
                  height: 57.0,
                  width: 309,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(255, 2, 152, 176),
                        Color.fromARGB(255, 124, 216, 89)
                      ])),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const Information();
                        }));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent),
                      child: Text(
                        "เข้าสู่ระบบ",
                        style: GoogleFonts.kanit(color: Colors.white),
                      )))))
    ]);
  }
}
