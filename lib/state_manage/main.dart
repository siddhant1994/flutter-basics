import 'package:flutter/material.dart';
import 'package:flutter_application_1/state_manage/Notifiers/CounterNotifier.dart';
import 'package:flutter_application_1/state_manage/Notifiers/UserNotifer.dart';
import 'package:flutter_application_1/state_manage/homePage.dart';
import 'package:provider/provider.dart';
void main() => runApp(new MyApp());

get basicTextStyle {
  return TextStyle(fontFamily: "ubuntu",fontSize: 16);
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(            
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=> CounterNotifer()),
          ChangeNotifierProvider(create: (context)=> UserNotifer())
        ],
        child: new HomePage()
      ),
      theme: new ThemeData( 
        primaryColor: Colors.orange,
      )
    );
  }
}