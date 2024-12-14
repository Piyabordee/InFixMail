import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Information extends StatelessWidget {
  const Information({super.key});

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
        backgroundColor: const Color.fromARGB(255, 138, 138, 138),
      ),
      body: Container(
        width: double.infinity,
        color: const Color.fromARGB(255, 138, 138, 138),
        child: Column(children: [
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
              )),
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
                  onPressed: () {},
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
                  onPressed: () {},
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
                  onPressed: () {},
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
        ]),
      ),
    ));
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
    return Row(
      children: [
        Image.network(
          "https://cdn.icon-icons.com/icons2/11/PNG/256/child_person_people_guy_1721.png",
          width: 130,
          height: 130,
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
                  "รหัสนักศึกษา",
                  style: GoogleFonts.kanit(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "ชื่อ",
                  style: GoogleFonts.kanit(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "สาขา",
                  style: GoogleFonts.kanit(
                      fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
