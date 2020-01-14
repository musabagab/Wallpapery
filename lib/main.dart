import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new MyApp(),
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
        seconds: 5,
        navigateAfterSeconds: AfterSplash(),
        title: Text(
          'Wallpapery',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
        ),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: TextStyle(),
        photoSize: 100.0,
        image: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1N_9IbSVmbMMCtLAWB06LA3HPj_KzuOQjU6kkXTqnJtqNDPV5&s'),
        onClick: () => print("Flutter SpashScreen"),
        loaderColor: Colors.red);
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Welcome In SplashScreen Package"),
          automaticallyImplyLeading: false),
      body: Center(
        child: Text(
          "Done!",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
        ),
      ),
    );
  }
}
