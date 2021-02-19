import 'package:flutter/material.dart';
import 'package:flutter_application_1/basics/homePage.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(            
      home: new HomePage(),
      theme: new ThemeData( 
        primarySwatch: Colors.pink,
        // brightness: Brightness.dark
      )
    );
  }
}