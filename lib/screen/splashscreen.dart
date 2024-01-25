import 'dart:async';
import 'package:flutter/material.dart';

import 'homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3), () {
       Navigator.of(context).pushAndRemoveUntil(
           MaterialPageRoute(builder: (context) => HomePage()),
               (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('Assets/img/img_2.png'))),
          ),
          Center(
            child: Text(
              "News App",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}