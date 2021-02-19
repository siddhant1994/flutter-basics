import 'package:flutter/material.dart';
import 'package:flutter_application_1/schedule/Details.dart';
import 'package:flutter_application_1/schedule/main.dart';
import 'package:intl/intl.dart';
import 'package:loading/indicator/ball_grid_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_application_1/schedule/Models/match_list.dart';

class MatchList extends StatefulWidget {
  final String appTitle;
  const MatchList ({ Key key, this.appTitle }): super(key: key);

  @override
  _MatchListState createState() => _MatchListState();
}

class _MatchListState extends State<MatchList> {
  Matches _matchList;
  bool _isLoading = false;

  String _endPoint = "http://localhost:3000/msfeed?sd={start_date}&ed={end_date}";

  @override
  void initState(){
    super.initState();
    fetchMatchList();
  }

  Future<void> _fetchMatchList() async {
    var data =  await rootBundle.loadString('json/match.json');
    var decodedRes = json.decode(data);
    setState(() {
      _matchList = Matches.fromJson(decodedRes);
      _isLoading = false;
    });
  } 

  Future fetchMatchList() async{
    setState(() {
      _isLoading = true;
    });

    try{
      DateTime start = DateTime.now();
      DateTime end = start.add(new Duration(days: 0));

      _endPoint  = _endPoint.replaceFirst(RegExp("{start_date}"), formatDate(start));
      _endPoint  = _endPoint.replaceFirst(RegExp("{end_date}"), formatDate(end));

      http.Response response = await http.get(_endPoint);

      Timer(Duration(seconds: 2), () => {
        setState(() {
        var decodedRes = json.decode(response.body);
          _matchList = Matches.fromJson(decodedRes);
          _isLoading = false;
        })
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
    return Scaffold(
        appBar:AppBar(title: Text(this.widget.appTitle,style: basicTextStyle),centerTitle: true),
        body: _isLoading ? _showLoader() : _getMatchList()
    );
  }

  Widget _getMatchList(){
    Widget _list = ListView.builder(
        itemCount: _matchList?.matches != null ?_matchList.matches.length : 0, 
        itemBuilder: (BuildContext context,int index){
          return InkWell(
            child:Column(
              children: [
                _listItem(_matchList.matches[index]),
                Divider(
                  color: Colors.black,
                  thickness: 1,
                  height: 0.1,
                )
              ]
            ),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(),
                  // Pass the arguments as part of the RouteSettings. The
                  // DetailScreen reads the arguments from these settings.
                  settings: RouteSettings(
                    arguments: _matchList.matches[index],
                  ),
                ),
              );
            },
          );
        }
    );

    return Container(
      child: _list 
    );
  }

  Widget _listItem(MatchObject match_details){
    Map<String, String> bgColors = {
      "R": "#f8d7da",
      "U": "#d1ecf1",
      "L": "#d4edda",
    };

    _dateString(DateTime date){
      return new DateFormat("MMM d, ''yy").format(date);
    }

    return Container(
      // padding: const EdgeInsets.all(10),
      color:  hexStringToColor(bgColors[match_details.event_state]),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  match_details.participants[0].short_name,
                  style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold).merge(basicTextStyle)
                ),
                Text("VS",style: basicTextStyle),
                Text(
                  match_details.participants[1].short_name,
                  style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold).merge(basicTextStyle)
                ),
              ]
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                  Text(
                    _dateString(
                      DateTime.parse(match_details.start_date)
                    ),
                    style: TextStyle().merge(basicTextStyle)
                  ),
                  Text(
                    match_details.event_name,
                    style: TextStyle().merge(basicTextStyle)
                  ),
              ]
            )
          ),
        ],
      ),
    );
  }

  Widget _showLoader(){
    return Center(child: 
      Loading(indicator: BallGridPulseIndicator(), size: 100.0,color: Colors.grey)
    ); 
  }
}