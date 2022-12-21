import 'package:flutter/material.dart';
import 'package:portalsped/Classes/MyCustomBehavior.dart';
import 'package:portalsped/Classes/Utils.dart';
import 'package:portalsped/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: buildMaterialColor(Color.fromRGBO(13, 62, 178, 1)),
      ),
      home: const MyHomePage(),
    );
  }
}

