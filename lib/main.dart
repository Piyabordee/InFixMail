import 'package:fixmail/src/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

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
                  side: const BorderSide(width: 0.50, color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center, // จัดตำแหน่ง
                children: [
                  Top(),
                  Login(),
                ],
              )),
        ]),
      ),
    ));
  }
}
