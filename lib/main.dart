import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:wallpapery/service_locator.dart';
import 'package:wallpapery/ui/home_view.dart';

void main() {
  setupLocator();
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 2,
        navigateAfterSeconds: HomeView(),
        title: Text(
          'Wallpapery',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 60.0,
              fontFamily: 'Pacifico'),
        ),
        backgroundColor: Colors.white,
        photoSize: 100.0,
        loaderColor: Colors.transparent);
  }
}
