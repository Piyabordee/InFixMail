import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:inmailfix/firstscreen.dart';
import 'firebase_options.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    print("การเริ่มต้น Firebase ล้มเหลว(piyabordee): $e");
  }
  runApp(
    const MyAppRoute(),
  );
}

class MyAppRoute extends StatelessWidget {
  const MyAppRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}
