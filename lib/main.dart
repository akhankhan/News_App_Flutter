import 'package:flutter/material.dart';
import 'package:news/screen/home_page.dart';
import 'package:news/screen/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showingSplashScreen = true;

  loadHome() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        showingSplashScreen = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHome();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          headline5: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodyText2: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
          bodyText1: TextStyle(
            fontSize: 14,
            color: Colors.white,
            // color: Colors.black38,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: showingSplashScreen ? const SplashScreen() : const HomgePage(),
    );
  }
}
