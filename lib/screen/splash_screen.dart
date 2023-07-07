import 'dart:async';
import 'package:floward/screen/introduction_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => IntroductionScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('images/cfe44b43-9be6-4985-89a7-db3b56d0fbe7.jpg'),
            Image.asset('images/1c755d78-7404-473f-a7bb-96c6a16480ed.jpg'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('© 2023 Floward. All rights reserved',style: TextStyle(color: Colors.cyan[900]),),
            )
          ],
        )
    );
  }
}
