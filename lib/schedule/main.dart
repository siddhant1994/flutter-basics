import 'package:flutter/material.dart';
import 'package:flutter_application_1/schedule/match_list.dart';
void main() => runApp(new MyApp());
//3F3B7E

hexStringToColor(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  return Color(int.parse(hexColor, radix: 16));
}


get basicTextStyle {
  return TextStyle(fontFamily: "ubuntu",fontSize: 16);
}


String padding(String str){
  return str.length == 1 ? "0" +"$str" : str; 
}

String formatDate(DateTime date){
    String day = padding(date.day.toString());
    String month = padding(date.month.toString());
    String year = padding(date.year.toString());
    return "$day"+"$month"+"$year";
}

class MyApp extends StatelessWidget {
  final appTitle = "Schedule Today";

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(            
      home: new MatchList(appTitle:appTitle),
      theme: new ThemeData( 
        primaryColor: Colors.red,
        // brightness: Brightness.dark
      )
    );
  }
}