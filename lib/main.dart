import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:movie_app/views/app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie app',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: EasySplashScreen(
          logo: Image.network(
              'https://cdn4.iconfinder.com/data/icons/logos-brands-5/24/flutter-512.png'),
          title: Text(
            "MY TOP",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.black,
          showLoader: true,
          loadingText: Text(
            "Loading...",
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          navigator: HomePage(),
          durationInSeconds: 10,
        ));
  }
}
