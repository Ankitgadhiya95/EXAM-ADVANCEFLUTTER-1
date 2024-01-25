import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/api/newsapi.dart';
import 'package:newsapp/model/newsmodel.dart';
import 'package:newsapp/newsprovider.dart';
import 'package:provider/provider.dart';
import 'detailpage.dart';
import 'likednews.dart';
import 'newsscreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController;
  bool isLoading = false;
  bool isCategory = false;

  @override
  void initState() {

    final newsProvide =Provider.of<NewsProvide>(context,listen: false);


    setState(() {
      isLoading = true;
      isCategory = true;
    });
    newsProvide.loadNews().then((value) {
      setState(() {
        isLoading = false;
      });
    });
    setState(() {
      isCategory = true;
    });
    newsProvide.loadCategoryWiseNews("business").then((value) {
      setState(() {
        isCategory = false;
      });
    });
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final newsProvide = Provider.of<NewsProvide>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("NEWS"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LikedNewsScreen()));
            },
            icon: Icon(
              Icons.menu,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 190,
                child: (isLoading == true)
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : CarouselSlider(
                        options: CarouselOptions(
                          aspectRatio: 2.0,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                          autoPlay: true,
                        ),
                        items: newsProvide.newsList
                            .map((e) => Center(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => NewsScreen(
                                            name: e.name!,
                                            category: e.category!,
                                            description:  e.description!,
                                          )));
                                    },

                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                              "Assets/img/img.png",
                                            ),
                                            fit: BoxFit.cover),
                                        //  color: Colors.red,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Text(
                                                    e.category!,
                                                    style: TextStyle(
                                                        color: Colors.green,
                                                        fontSize: 15),
                                                  ),
                                                )),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  e.name!,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                  e.description!,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                      )),
            SizedBox(
              height: 13,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isCategory = true;
                      });
                      newsProvide.loadCategoryWiseNews('business').then((value) {
                        setState(() {
                          isCategory = false;
                        });
                      });
                    },
                    child: Container(
                      height: 36,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.red)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text("BUSINESS")),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isCategory = true;
                      });
                      newsProvide
                          .loadCategoryWiseNews('entertainment')
                          .then((value) {
                        setState(() {
                          isCategory = false;
                        });
                      });
                    },
                    child: Container(
                      height: 36,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.red)),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("ENTERTAINMENT")),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isCategory = true;
                      });
                      newsProvide
                          .loadCategoryWiseNews('general')
                          .then((value) {
                        setState(() {
                          isCategory = false;
                        });
                      });

                    },
                    child: Container(
                      height: 36,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.red)),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("GENERAL")),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          isCategory = true;
                        });
                        newsProvide
                            .loadCategoryWiseNews('health')
                            .then((value) {
                          setState(() {
                            isCategory = false;
                          });
                        });

                      },
                      child: Container(
                        height: 36,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.red)),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("HEALTH")),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          isCategory = true;
                        });
                        newsProvide
                            .loadCategoryWiseNews('science')
                            .then((value) {
                          setState(() {
                            isCategory = false;
                          });
                        });

                      },
                      child: Container(
                        height: 36,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.red)),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("SCIENCE")),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          isCategory = true;
                        });
                        newsProvide
                            .loadCategoryWiseNews('sports')
                            .then((value) {
                          setState(() {
                            isCategory = false;
                          });
                        });

                      },
                      child: Container(
                        height: 36,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.red)),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("SPORTS")),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                      onTap: (){
                        setState(() {
                          isCategory = true;
                        });
                        newsProvide
                            .loadCategoryWiseNews('tecgnology')
                            .then((value) {
                          setState(() {
                            isCategory = false;
                          });
                        });

                      },
                      child: Container(
                        height: 36,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                            border: Border.all(color: Colors.red)),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("TECHNOLOGY")),
                      ))
                ],
              ),
            ),
            IndexedStack(
              index: 0,
              children: [
                (isCategory == true)
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        height: 400,
                        child:
                            TabBarView(controller: _tabController, children: [
                          DetailPage(NewsList: newsProvide.getCategoryWiseList),
                        ]),
                      ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
