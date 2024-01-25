import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {
  final String name;
  final String category;
  final String description;

  const NewsScreen(
      {super.key,
      required this.name,
      required this.category,
      required this.description});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.category),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.share))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 280,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage("Assets/img/img_1.png"),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                widget.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.category,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.description,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
