
import 'package:flutter/material.dart';
import 'package:flutter_application_1/player_selector/Notifiers/PlayerListNotifer.dart';
import 'package:flutter_application_1/player_selector/Views/ListPage.dart';
import 'package:flutter_application_1/player_selector/Views/SplashScreen.dart';
import 'package:flutter_application_1/player_selector/Views/StatsScreen.dart';
import 'package:provider/provider.dart';
// void main() async{
//   Helper _helper = Helper();
//   await _helper.setUpBusters();
//   Timer(Duration(seconds: 2), () async {
//     ApiServices _services = ApiServices();
//     await _services.getReq("/get_team", {},{});
//   });
//   runApp(new MyApp());
// } 

void main() {
  runApp(
    SplashScreen(
      key: UniqueKey(),
      onInitializationComplete: () => runMainApp(),
    ),
  );
}

void runMainApp() {
  runApp(
    MyApp(),
  );
}

get basicTextStyle {
  return TextStyle(fontFamily: "ubuntu",fontSize: 16);
}

class MyApp extends StatelessWidget {
  
  /*
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
  */

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
          initialRoute: '/',
          routes: {
            '/' : (conetext){
              return Scaffold(
                appBar: AppBar(title:Text("Test BG")),
                body: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/gameplay.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Text("Center",
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 30,
                          fontFamily: 'ubuntu'
                        )
                    ) 
                  ),
                )
              );
            },
            '/list' : (context) => ListPage(),
            '/stats' : (context) => StatsScreen(),
          },
        )
    );
  }
}