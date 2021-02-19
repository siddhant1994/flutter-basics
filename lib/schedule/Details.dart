import 'package:flutter/material.dart';
import 'package:flutter_application_1/schedule/Models/match_list.dart';
import 'package:flutter_application_1/schedule/main.dart';

class DetailScreen extends StatelessWidget {
  String _getTitle(MatchObject match){
    return "Details"; 
  }
  
  @override
  Widget build(BuildContext context) {
    final MatchObject match = ModalRoute.of(context).settings.arguments;
    final Map<String,String> eventState = {
      "L" :"Live",
      "U" :"Upcoming",
      "R" :"Recent",
    };
    return Scaffold(
      appBar: AppBar(
        title: Text(_getTitle(match)),
      ),
      body: Container(
        child: Column(
          children: [    
            Container(
              height: MediaQuery.of(context).size.height*0.2,
              color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child:Text(match.participants[0].name,style: TextStyle(fontSize: 31).merge(basicTextStyle)),
                  ),
                  Expanded(
                    child: Text(match.participants[1].name,style: TextStyle(fontSize: 31).merge(basicTextStyle))
                  )
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child:Row(
                    children:[
                      Text("Event Venue:",style: TextStyle(fontSize: 20).merge(basicTextStyle)),
                      Expanded(
                        child : Text(match.venue_name,style: TextStyle(color: Colors.grey[600]).merge(basicTextStyle))
                      )
                    ]
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child:Row(
                    children:[
                      Text("Event name:",style: TextStyle(fontSize: 20).merge(basicTextStyle)),
                      Expanded(child: 
                        Text(match.event_name,style: TextStyle(color: Colors.grey[600]).merge(basicTextStyle))
                      )
                    ]
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child:Row(
                    children:[
                      Text("Event State:",style: TextStyle(fontSize: 20).merge(basicTextStyle)),
                      Text(eventState[match.event_state],style: TextStyle(color: Colors.grey[600]).merge(basicTextStyle))
                    ]
                  ),
                ),
              ]
            ),
            
          ]
        )
      ),
    );
  }
}