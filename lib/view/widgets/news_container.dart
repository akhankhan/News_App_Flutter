import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/screen/details_view.dart';

class NewsContainer extends StatelessWidget {
  NewsContainer({
    Key? key,
    required this.imgUrl,
    required this.newshead,
    required this.newsDis,
    required this.content,
    required this.newsUrl,
    required this.isLoading,
  }) : super(key: key);

  String imgUrl;
  String newshead;
  String newsDis;
  String content;
  String newsUrl;
  bool isLoading;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ClipRRect(
        //   borderRadius: const BorderRadius.only(
        //     bottomLeft: Radius.circular(15),
        //     bottomRight: Radius.circular(15),
        //   ),
        //   child: FadeInImage.assetNetwork(
        //     placeholder: 'assets/Loader.gif',
        //     fit: BoxFit.cover,
        //     image: imgUrl,
        //     height: height * 0.5,
        //     width: width,
        //   ),
        // ),
        isLoading
            ? CircularProgressIndicator()
            : Image.network(
                imgUrl,
                height: height * 0.5,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),

        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  // color: Colors.grey,
                  width: width,
                  child: Text(
                    newshead,
                    style: GoogleFonts.montserrat(
                        fontSize: 25,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  // color: Colors.red,
                  width: width,
                  child: Text(
                    newsDis,
                    style: GoogleFonts.montserrat(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  // color: Colors.blue,
                  width: width,
                  height: height * 0.1,
                  child: Text(
                    content.length > 220 ? content.substring(0, 220) : content,
                    style: GoogleFonts.montserrat(
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
        // Expanded is extra implement here...
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0XFFee1b24),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailsView(newsUrl: newsUrl)));
                  },
                  child: Text(
                    'Read More',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
