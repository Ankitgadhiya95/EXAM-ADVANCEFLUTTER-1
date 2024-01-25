import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'api/newsapi.dart';
import 'model/newsmodel.dart';
import 'package:http/http.dart' as http;

class NewsProvide with ChangeNotifier{

  List <Source> newsList=[];
  List <Source> categoryWiseList=[];


  get getNewList => newsList;
  get getCategoryWiseList => categoryWiseList;

  Future loadNews() async {
    var data = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines/sources?apiKey=f316d89fb74b42c2a45be24372671d49"));
    print(data.body);

    var response = jsonDecode(data.body)['sources'];
    print("abc $response");
    for (int i=0;i<=5;i++) {

      newsList.add(Source.fromJson(response[i]));
    }

    print("newslist ${newsList.length}");
    notifyListeners();
  }


  Future loadCategoryWiseNews(String category) async {
    categoryWiseList.clear();

    var data = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines/sources?category=$category&apiKey=f316d89fb74b42c2a45be24372671d49"));
    print(data.body);

    var response = jsonDecode(data.body)['sources'];
    print("abc $response");
    for (var r in response) {

      categoryWiseList.add(Source.fromJson(r));
    }

    notifyListeners();
  }





}