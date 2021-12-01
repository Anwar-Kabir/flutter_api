import 'package:flutter/material.dart';
import 'package:flutter_api/example_five.dart';
import 'package:flutter_api/example_four.dart';
import 'package:flutter_api/example_three.dart';
import 'package:flutter_api/exampletwo.dart';
import 'package:flutter_api/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      //home:   MyHomePage(),
      //home:   ExampleTwo(),
      //home: ExampleThree(),
      //home:  ExampleFour(),
        home: LastExampleScreen(),
    );
  }
}


