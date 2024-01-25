import 'package:flutter/material.dart';

import '../model/newsmodel.dart';
import 'newsscreen.dart';

class DetailPage extends StatefulWidget {
  final List<Source> NewsList;

  const DetailPage({super.key, required this.NewsList});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        height: 400,
        child: ListView.builder(
          itemCount: widget.NewsList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NewsScreen(
                          name: widget.NewsList[index].name!,
                          category:  widget.NewsList[index].category!,
                          description:  widget.NewsList[index].description!,
                        )));
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 130,
                      width: 160,
                      // color: Colors.red,
                      decoration: BoxDecoration(
                         // color: Colors.red,
                          image: DecorationImage(
                              image: AssetImage(
                                "Assets/img/img_1.png",
                              ),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.NewsList[index].name!,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                      Container(
                          width: 200,
                          child: Text(widget.NewsList[index].description!,style: TextStyle(fontSize: 10,))),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(widget.NewsList[index].category!,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500)),
                          SizedBox(
                            width: 100,

                          ),
                          Icon(Icons.save)
                        ],
                      ),SizedBox(
                        height: 30,
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
