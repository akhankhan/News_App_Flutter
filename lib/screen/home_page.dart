import 'package:flutter/material.dart';
import 'package:news/model/model.dart';
import 'package:news/model/model2.dart';
import 'package:news/services/services.dart';
import 'package:news/services/services2.dart';
import 'package:news/view/widgets/news_container.dart';

class HomgePage extends StatefulWidget {
  const HomgePage({Key? key}) : super(key: key);

  @override
  State<HomgePage> createState() => _HomgePageState();
}

class _HomgePageState extends State<HomgePage> {
  bool isLoading = true;

  late NewsArt newsArt;

  getNews() async {
    newsArt = await FetchNews.fetchNews();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // FetchNews.fetchNews();
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0XFFe0314d),
      backgroundColor: Colors.grey[300],
      body: FutureBuilder(
        future: getPosts(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            List<Article> news = snapshot.data;
            return PageView.builder(
              controller: PageController(initialPage: 0),
              scrollDirection: Axis.vertical,
              onPageChanged: (value) {
                setState(() {
                  isLoading = true;
                });
                getNews();
              },
              itemCount: news.length,
              itemBuilder: (context, index) {
                return isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : NewsContainer(
                        imgUrl: newsArt.imgUrl,
                        newshead: newsArt.newsTitle,
                        newsDis: newsArt.newsDes,
                        newsUrl: newsArt.newsUrl,
                        content: newsArt.newsCont,
                        isLoading: isLoading,
                      );
              },
            );
          }
        },
      ),
    );
  }
}

             

// Scaffold(
//       body: FutureBuilder(
//         future: getPosts(),
//         builder: (context, AsyncSnapshot snapshot) {
//           if (!snapshot.hasData) {
//             return const Center(child: CircularProgressIndicator());
//           } else {
//             List<Article> news = snapshot.data;
//             return PageView.builder(
//               controller: PageController(initialPage: 0),
//               scrollDirection: Axis.vertical,
//               itemCount: news.length,
//               itemBuilder: (context, index) {
//                 return NewsContainer(
//                   imgUrl: news[index].urlToImage,
//                   newshead: news[index].title,
//                   newsDis: news[index].description,
//                   newsUrl: news[index].url,
//                 );
//               },
//             );
//           }
//         },
//       ),
//     )



// Scaffold(
//       body: PageView.builder(
//         controller: PageController(initialPage: 0),
//         scrollDirection: Axis.vertical,
//         itemCount: 4,
//         itemBuilder: (context, index) {
//           FetchNews.fetchNews();
//           return NewsContainer(
//             imgUrl: 'news[index].urlToImage',
//             newshead: 'news[index].title',
//             newsDis: 'news[index].description',
//             content: 'news[index].description',
//             newsUrl: ' news[index].url',
//           );
//         },
//       ),
//     );