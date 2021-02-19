import 'package:flutter/material.dart';
import 'package:flutter_application_1/yahoo_layout/match_details.dart';
void main() => runApp(new MyApp());
//3F3B7E

hexStringToColor(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  return Color(int.parse(hexColor, radix: 16));
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(            
      home: new MatchDetails(),
      theme: new ThemeData( 
        primaryColor: hexStringToColor("#3F3B7E"),
        // brightness: Brightness.dark
      )
    );
  }
}