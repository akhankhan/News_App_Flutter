import 'package:http/http.dart' as http;
import 'package:news/model/model.dart';

// var fullkey = 'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=048bae5c559747b38f3836bc830db68c';

var base = 'https://newsapi.org/v2/top-headlines?country=us&apiKey';
var apikey = '048bae5c559747b38f3836bc830db68c';

getPosts() async {
  List sourceId = [
    "abc-news",
    "abc-news-au",
    "aftenposten",
    "al-jazeera-english",
    "ansa",
    "argaam",
    "ars-technica",
    "ary-news",
    "associated-financial-review",
    "axios",
    "bbc-news",
    "bbc-sport",
    "bild",
    "blasting-news-br",
    "bleacher-report",
    "bloomberg",
    "breitbart-news",
    "business-insider",
    "business-insider-uk",
    "buzzfeed",
    "cbc-news",
    "cbs-news",
    "cnn",
    "google-news",
    "google-news-ar",
    "google-news-au",
    "google-news-br",
    "google-news-ca",
    "google-news-fr",
  ];

  Uri url = Uri.parse(
      "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=048bae5c559747b38f3836bc830db68c");

  var res = await http.get(url);

  try {
    if (res.statusCode == 200) {
      var data = newsFromJson(res.body);
      return data.articles;
    }
  } catch (e) {
    print(e.toString());
  }
}
