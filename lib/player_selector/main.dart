import 'package:flutter/material.dart';
import 'package:flutter_application_1/player_selector/Notifiers/PlayerListNotifer.dart';
import 'package:flutter_application_1/player_selector/Views/ListPage.dart';
import 'package:flutter_application_1/player_selector/Views/StatsScreen.dart';
import 'package:provider/provider.dart';
void main() => runApp(new MyApp());

get basicTextStyle {
  return TextStyle(fontFamily: "ubuntu",fontSize: 16);
}

class MyApp extends StatelessWidget {
  
  Widget _build(BuildContext context) {
    return new MaterialApp(    
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=> PlayerListNotifer()..fetchPlayerList()),
        ],
        child: ListPage()
      ),
      theme: new ThemeData( 
        primaryColor: Colors.teal,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=> PlayerListNotifer()..fetchPlayerList()),
        ],
        child: MaterialApp(
          theme: new ThemeData( 
            primaryColor: Colors.teal,
          ),
          routes: {
            '/' : (context) => ListPage(),
            '/stats' : (context) => StatsScreen(),
          },
        )
    );
  }
}