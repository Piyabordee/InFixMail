import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:inmailfix/src/login.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  void initState() {
    super.initState();

    checkInternetConnection();
  }

  Future<void> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      _showToast('Mobile Data available');
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      _showToast("Wi-fi is available");
    } else if (connectivityResult.contains(ConnectivityResult.ethernet)) {
      _showToast('Ethernet connection available');
    } else if (connectivityResult.contains(ConnectivityResult.vpn)) {
      _showToast('Vpn connection available');
    } else if (connectivityResult.contains(ConnectivityResult.bluetooth)) {
      _showToast('Bluetooth connection available');
    } else if (connectivityResult.contains(ConnectivityResult.other)) {
      _showToast('Other connection available');
    } else if (connectivityResult.contains(ConnectivityResult.none)) {
      setState(() {
        _showAlertDialog(context, "Error", "No available network");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Color(0xFF1F1F1F), Colors.white],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(0.6, 0.5),
            tileMode: TileMode.mirror),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              './assets/icon/icon.png',
              height: 100.0,
              width: 100.0,
            ),
          ),
          // Image.asset(
          //   './assets/icon/icon.png',
          //   height: 100,
          // ),
          const SizedBox(
            height: 50,
          ),
          const SpinKitWaveSpinner(
            color: Color(0xFF1F1F1F),
            size: 50.0,
          ),
        ],
      ),
    );
  }

  void _showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color(0xFF1F1F1F),
        textColor: Colors.white,
        fontSize: 12.0);
    _timer();
  }

  void _timer() {
    Timer(
        const Duration(seconds: 5),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => const MyApp())));
  }

  void _showAlertDialog(BuildContext context, String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(
                fontSize: 20,
                color: Colors.red,
                fontFamily: "Alike",
                fontWeight: FontWeight.w500),
          ),
          content: Text(msg),
          actions: <Widget>[
            ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll<Color>(Colors.lightGreen)),
                onPressed: () => SystemNavigator.pop(),
                child: const Text(
                  "OK",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: "Alike",
                      fontWeight: FontWeight.w500),
                ))
          ],
        );
      },
    );
  }
}
