// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// import '../model/newsmodel.dart';
//
//
// News ? jsonList;
// // List<Hit> histList = [];
//
// class News {
//   Future loadNews() async {
//     var data = await http.get(Uri.parse(
//         "https://newsapi.org/v2/top-headlines/sources?apiKey=f316d89fb74b42c2a45be24372671d49"));
//     print(data.body);
//
//     var response = jsonDecode(data.body)['sources'];
//     print("abc $response");
//     for (int i=0;i<=5;i++) {
//
//       newsList.add(Source.fromJson(response[i]));
//     }
//     print("xyz $jsonList");
//     print("newslist ${newsList.length}");
//   }
//
//   Future loadCategoryWiseNews(String category) async {
//     categoryWiseList.clear();
//
//     var data = await http.get(Uri.parse(
//         "https://newsapi.org/v2/top-headlines/sources?category=$category&apiKey=f316d89fb74b42c2a45be24372671d49"));
//     print(data.body);
//
//     var response = jsonDecode(data.body)['sources'];
//     print("abc $response");
//     for (var r in response) {
//
//       categoryWiseList.add(Source.fromJson(r));
//     }
//     print("xyz $jsonList");
//   }
//
// }
//
//
//
