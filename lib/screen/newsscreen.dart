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
      backgroundColor: Theme.of(context).primaryColor!,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.category),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.share))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 280,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(20)
                    // image: DecorationImage(
                    //     image: AssetImage(widget.image), fit: BoxFit.cover),
                    ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                widget.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize:
                      15, /*  color: Theme.of(context).appBarTheme.titleTextStyle!.color*/
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.category,
                style: TextStyle(
                  fontSize: 13,
                  /* color: Theme.of(context).appBarTheme.titleTextStyle!.color*/
                ),
              ),
              Text(
                widget.description,
                style: TextStyle(
                  // fontWeight: FontWeight.w400,
                  fontSize: 16,
                  // color: Theme.of(context).appBarTheme.titleTextStyle!.color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
