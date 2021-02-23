import 'package:flutter/material.dart';
import 'package:flutter_application_1/player_selector/Common/ApiServices.dart';
import 'package:flutter_application_1/player_selector/Common/Helper.dart';
import 'dart:async';


class SplashScreen extends StatefulWidget {

  final VoidCallback onInitializationComplete;

  const SplashScreen({
    Key key,
    @required this.onInitializationComplete,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _initializeAsyncDependencies();
  }

  Future<void> _initializeAsyncDependencies() async {
    Helper _helper = Helper();
    ApiServices _services = ApiServices();

    
    await _helper.setUpBusters();
    await _services.getReq("/get_team", {},{});
    
    /**
    * config api
    * transalations
    * fixtures api
     */
    
    // >>> initialize async dependencies <<<
    // >>> register favorite dependency manager <<<
    // >>> reap benefits <<<
    widget.onInitializationComplete();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Center(child: Text("SplashScreen")),
    );
  }
}