import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'information.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(// กำหนดขนาดหน้าจอโดย AUTO DPI ทุกอุปกรณ์
        builder: (context, child) {
      return MaterialApp(
          home: Scaffold(
              appBar: AppBar(
                title: Text(
                  "InMailFix v1.0.2",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
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
                        width: 320.w,
                        height: 480.h,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF1F1F1F),
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 0.50.w, color: Colors.white),
                            borderRadius: BorderRadius.circular(10.r),
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
    });
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
                  image: AssetImage("assets/icon/icon.jpg"), // รูปภาพ
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              width: 90.r,
              height: 90.r,
            ),
            SizedBox(
              width: 25.w,
            ),
            Column(
                mainAxisSize:
                    MainAxisSize.min, // ทำให้ Column ใช้แค่พื้นที่ที่จำเป็น
                children: [
                  Text(
                    "เข้าสู่ระบบ",
                    style: GoogleFonts.kanit(
                      color: const Color(0xFF7FD858),
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(height: 5.r),
                  Text('INMAILFIX',
                      style: GoogleFonts.kanit(
                          color: const Color(0xFFFF96D5),
                          fontSize: 32.sp,
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

FirebaseFirestore db = FirebaseFirestore.instance;

class UserDB {
  String email;
  String password;

  UserDB({required this.email, required this.password});
} // สร้าง class UserDB สำหรับเก็บข้อมูล email และ password

bool isChecked = false; // ตัวแปรของ checkbox
bool _isHidden = true; // ตัวแปรของ password
final formkey = GlobalKey<FormState>();
final TextEditingController idController =
    TextEditingController(); // สร้าง TextEditingController
UserDB user = UserDB(email: '', password: '');

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
    _loadRememberMeStatus(); // โหลดสถานะ "ติ้กถูก" จาก SharedPreferences
  }

  // ฟังก์ชันสำหรับโหลดสถานะ "ติ้กถูก"
  Future<void> _loadRememberMeStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isChecked = prefs.getBool('remember_me') ?? false;
    });

    // หากมีการติ้กถูกไว้ก่อนหน้า ให้ข้ามไปหน้า Home
    if (isChecked) {
      String? savedUserId = prefs.getString('user_id');
      if (savedUserId != null && savedUserId.isNotEmpty) {
        _navigateToInformation(savedUserId);
      }
    }
  }

  // บันทึกสถานะ Remember Me และ userId
  Future<void> _saveRememberMeStatus(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('remember_me', isChecked);
    await prefs.setString('user_id', userId);
  }

  // ฟังก์ชันนำทางไปหน้า Information
  void _navigateToInformation(String userId) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Information(userId: userId),
      ),
    );
  }

  // ฟังก์ชันเมื่อกด Login
  void _onLoginPressed() {
    if (isChecked) {
      _saveRememberMeStatus(idController.text); // บันทึก userId
    }
    _navigateToInformation(idController.text); // ไปหน้า Information
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 80, 0, 10),
              child: Text("รหัสประจำตัว",
                  style: GoogleFonts.kanit(
                    color: Colors.white,
                    fontSize: 14.sp,
                  )),
            ),
          ],
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
            child: TextFormField(
                validator:
                    RequiredValidator(errorText: "กรุณากรอกรหัสประจำตัว").call,
                controller: idController, // ใช้ TextEditingController
                onSaved: (String? value) {
                  user.email = "$value@wbac.ac.th";
                },
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: "ใส่รหัสประจำตัวของคุณ",
                    hintStyle: GoogleFonts.kanit(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                    filled: true,
                    fillColor:
                        const Color.fromRGBO(0, 0, 0, 0.3), // สีพื้นหลังใส
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))))),
        Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 0, 10),
                  child: Text("รหัสผ่าน (Wbacและต่อด้วยรหัสประจำตัว)",
                      style: GoogleFonts.kanit(
                        color: Colors.white,
                        fontSize: 14.sp,
                      )),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                child: TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: "กรุณากรอกรหัสผ่าน"),
                      MinLengthValidator(6,
                          errorText: "รหัสผ่านต้องมีอย่างน้อย 6 ตัวอักษร")
                    ]).call, // ตรวจสอบความถูกต้องของรหัสผ่าน
                    style: const TextStyle(color: Colors.white),
                    onSaved: (String? value) {
                      user.password = value!;
                    },
                    decoration: InputDecoration(
                        hintText: "ใส่รหัสผ่านของคุณ",
                        suffixIcon: IconButton(
                          color: Colors.white,
                          onPressed: () {
                            setState(() {
                              _isHidden =
                                  !_isHidden; // เมื่อกดก็เปลี่ยนค่าตรงกันข้าม
                            });
                          },
                          icon: Icon(_isHidden // เงื่อนไขการสลับ icon
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                        hintStyle: GoogleFonts.kanit(
                          color: Colors.white,
                          fontSize: 14.sp,
                        ),
                        filled: true,
                        fillColor:
                            const Color.fromRGBO(0, 0, 0, 0.3), // สีพื้นหลังใส
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    obscureText: _isHidden))
          ],
        ),
        Column(children: [
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value ?? true;
                        });
                      })),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text('จดจำการลงชื่อใช้งาน',
                      style: GoogleFonts.kanit(
                        fontSize: 14.sp,
                        color: Colors.white,
                      )))
            ],
          ),
        ]),
        Center(
            child: Container(
                height: 52.r,
                width: 290.r,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(colors: [
                      Color.fromARGB(255, 2, 152, 176),
                      Color.fromARGB(255, 124, 216, 89)
                    ])),
                child: ElevatedButton(
                    onPressed: () async {
                      try {
                        formkey.currentState!.save();
                        formkey.currentState!.validate();
                        await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: user.email, password: user.password)
                            .then((value) {
                          _onLoginPressed();
                          Fluttertoast.showToast(
                              msg: "เข้าสู่ระบบสำเร็จ",
                              gravity: ToastGravity.TOP);
                        });
                      } on FirebaseAuthException catch (e) {
                        Fluttertoast.showToast(
                            msg: "รหัสประจำตัวหรือรหัสผ่านไม่ถูกต้อง",
                            gravity: ToastGravity.CENTER);
                        print(
                            "piyabordee =${e.code}, ${e.message}"); // แสดง error code และ message ใน console
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent),
                    child: Text(
                      "เข้าสู่ระบบ",
                      style: GoogleFonts.kanit(color: Colors.white),
                    ))))
      ]),
    );
  }
}
