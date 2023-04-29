class NewsArt {
  String imgUrl;
  String newsTitle;
  String newsDes;
  String newsCont;
  String newsUrl;

  NewsArt({
    required this.imgUrl,
    required this.newsTitle,
    required this.newsDes,
    required this.newsCont,
    required this.newsUrl,
  });

  static NewsArt fromAPItoApp(Map<String, dynamic> artical) {
    return NewsArt(
      imgUrl: artical['urlToImage'] ??
          "https://media.istockphoto.com/photos/online-news-on-a-smartphone-and-laptop-woman-reading-news-or-articles-picture-id1219980553",
      newsTitle: artical["title"] ?? "--",
      newsDes: artical['description'] ?? "--",
      newsCont: artical['content'] ?? "--",
      newsUrl: artical['url'] ??
          "https://news.google.com/topstories?hl=en-PK&gl=PK&ceid=PK:en",
    );
  }
}
