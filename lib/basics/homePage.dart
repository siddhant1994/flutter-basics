import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:flutter_application_1/basics/Models/currency.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String cryptoUrl = "https://data.messari.io/api/v1/assets?fields=id,slug,name,symbol,metrics/market_data/price_usd,metrics/market_data/volume_last_24_hours,metrics/market_data/percent_change_usd_last_24_hours";
  
  CurrencyResponse marketResponse;
  // Map marketResponse;

  List currencies = [];
  List _colors = [
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.grey
  ];
  bool _isLoading = false;
  
  @override
  void initState(){
    super.initState();
    fetchCurrencies();
  }

  Future <void> fetchCurrencies() async{
    setState(() {
      _isLoading = true;
    });
    try{
      http.Response response = await http.get(cryptoUrl);
      setState(() {
        var decodedRes = json.decode(response.body);
        marketResponse = CurrencyResponse.fromJson(decodedRes);
        currencies = marketResponse.data;
        /*
        marketResponse = json.decode(response.body);
        currencies = marketResponse['data'];
        print(currencies[0].slug);
        */

        _isLoading = false;
      });
    }catch(e){
      print(e);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: Text("Test Crypto")),
      body: _isLoading ? showLoader(): cryptoWidget(),
    );
  }

  Widget showLoader(){
      return Center(child: 
        Loading(indicator: BallPulseIndicator(), size: 100.0,color: Colors.grey)
      ); 
  }

  Widget cryptoWidget(){
    Widget _list = ListView.builder(
        itemCount: currencies.length, 
        itemBuilder: (BuildContext context,int index){
          Currency currency = currencies[index];
          Color color = _colors[index % _colors.length];
          return _getItem(currency,color); 
        }
    );

    return Container(
      child: Column(
        children: [
          Flexible(child: _list)
        ]
      ) 
    );
  }

  Widget _getItem(Currency currency, Color color){
    ListTile _tile =  ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(
          currency.name[0],
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
        )
      ),
      title: Text(currency.name,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "ubuntu")),
      subtitle: _getSubtitle(
        currency.metrics.market_data.price_usd,
        currency.metrics.market_data.percent_change_usd_last_24_hours
      ),
      isThreeLine: true,
    );
    
    return _tile;
  }

  Widget _getSubtitle(price,change){
    TextStyle _perChangeStyle;

    TextSpan priceWidget = TextSpan(
      text:"\$${price.toStringAsFixed(2)}\n",
      style: TextStyle(color: Colors.grey[800],fontFamily: "ubuntu")
    ); 

    if(change > 0){
      _perChangeStyle = TextStyle(color: Colors.green,fontFamily: "ubuntu");
    }else{
      _perChangeStyle = TextStyle(color: Colors.red,fontFamily: "ubuntu");
    }
    TextSpan perChange = TextSpan(text:"Per. change in 24h : ${change.toStringAsFixed(4)}",style: _perChangeStyle);

    return RichText(text: TextSpan(children: [priceWidget,perChange]));
  }
}
