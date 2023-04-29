//"https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=048bae5c559747b38f3836bc830db68c"
//https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=048bae5c559747b38f3836bc830db68c
// "https://newsapi.org/v2/top-headlines?sources=$source&apiKey=048bae5c559747b38f3836bc830db68c"
import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart';
import 'package:news/model/model2.dart';

class FetchNews {
  static List sourceId = [
    "abc-news",
    "bbc-news",
    "bbc-sport",
    "business-insider",
    "engadget",
    "entertainment-weekly",
    "espn",
    "espn-cric-info",
    "financial-post",
    "fox-news",
    "fox-sports",
    "globo",
    "google-news",
    "google-news-in",
    "medical-news-today",
    "national-geographic",
    "news24",
    "new-scientist",
    "new-york-magazine",
    "next-big-future",
    "techcrunch",
    "techradar",
    "the-hindu",
    "the-wall-street-journal",
    "the-washington-times",
    "time",
    "usa-today",
  ];

  static Future<NewsArt> fetchNews() async {
    final _random = new Random();
    var source = sourceId[_random.nextInt(sourceId.length)];
    print(source);

    Response response = await get(
      Uri.parse(
          "https://newsapi.org/v2/top-headlines?sources=$source&apiKey=caea254bf2f94f869e831ec24284ece1"),
    );

    Map bodyData = jsonDecode(response.body);
    List articles = bodyData["articles"];
    // print(articles);
    // print(bodyData);

    final newRandomArtical = new Random();
    var randomArticles = articles[_random.nextInt(articles.length)];
    print(randomArticles);

    return NewsArt.fromAPItoApp(randomArticles);
  }
}
