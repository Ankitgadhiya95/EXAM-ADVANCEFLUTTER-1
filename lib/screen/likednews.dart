import 'package:flutter/material.dart';

class LikedNewsScreen extends StatefulWidget {
  const LikedNewsScreen({super.key});

  @override
  State<LikedNewsScreen> createState() => _LikedNewsScreenState();
}

class _LikedNewsScreenState extends State<LikedNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Liked News"),
      ),
      body: Column(
        children: [
          Text("Hello")
        ],
      ),
    );
  }
}
