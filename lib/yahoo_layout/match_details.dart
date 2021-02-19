import 'package:flutter/material.dart';
import 'package:flutter_application_1/yahoo_layout/main.dart';

RichText getTitle(){
  double size = 25;
  TextStyle def = TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: size,fontFamily: "san-serif");

  TextSpan titleFrag1 = TextSpan(text:"yahoo",style:def);
  TextSpan titleFrag2 = TextSpan(text:"!",style: def.merge(TextStyle(fontStyle: FontStyle.italic)));
  TextSpan titleFrag3 = TextSpan(text:"cricket",style: def);

  return RichText(
    text: TextSpan(
      children: [
        titleFrag1,
        titleFrag2,
        titleFrag3
      ]
    )
  );
} 

class MatchDetails extends StatefulWidget {
  @override
  _MatchDetailsState createState() => _MatchDetailsState();
}

class _MatchDetailsState extends State<MatchDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(icon:Icon(Icons.menu,color: Colors.white), onPressed:  null,color: Colors.white,),
          title: getTitle(),
          centerTitle:true,
          actions: [
            IconButton(icon:Icon(Icons.search,color: Colors.white), onPressed:  null)
          ],
        ),
        body: _getMatchDetailsPage(),
    );
  }

  Widget _getMatchDetailsPage(){

    TextStyle _inActive = TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14,fontFamily: "san-serif");
    TextStyle _active = TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14,fontFamily: "san-serif");

    Widget _breadCrums = Container(
      color: Colors.white,
      padding: EdgeInsets.only(top:20.0),
    );

    Widget _dividerLine = Divider(
            color: Colors.grey,
            height: 0.5,
            thickness: 0.5,
            indent: 20,
            endIndent: 20,
    );

    Widget _matchNameState = Container(
      // height: MediaQuery.of(context).size.height * 0.09,
      color: hexStringToColor("#3E3B7E"),
      padding: EdgeInsets.all(16.0),
      child: Row(
        children:[
          Expanded(
            child : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Bangladesh Vs West Indies', style: TextStyle(color: Colors.white,fontFamily: "san-serif")),
                Text('- Live cricket scores', style: TextStyle(color: Colors.white,fontFamily: "san-serif")),
              ]
            )
          ),
          Expanded(
            flex: 0,
            child:Text("Live",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontFamily: "san-serif"))
          )
        ],
      )
    );

    Widget _matchStatusInfo = Container(
      // height: MediaQuery.of(context).size.height * 0.06,
      color: hexStringToColor("#2B295B"),
      padding: const EdgeInsets.only(left:8.0),
      child: Row(
        children: [
          Expanded(
            child: Text("Day 1 - Stumps",style: TextStyle(color: Colors.white,fontFamily: "san-serif"))
          ),
          Expanded(
            child:Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Match Info",style: TextStyle(color: Colors.white,fontFamily: "san-serif")),
                IconButton(
                  icon: Icon(Icons.info_outline,color: Colors.white),
                  onPressed:  null,
                )
              ],
            )
          )
        ],
      ),
    );
    
    Widget _matchTeamDetails = Container(
      padding: const EdgeInsets.all(13.0),
      color: hexStringToColor("#3F3B7E"),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right : 10.0,top : 10.0,bottom : 10.0),
                      child:Image.network("https://cricket.yahoo.net/static-assets/flags/min/9.png",width: 60),
                    ),
                    Text("BAN",style: _inActive),
                  ],
                ) 
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Yet to bat",style: _inActive)
                  ]
                )
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right : 10.0,top : 10.0,bottom : 10.0),
                      child:Image.network("https://cricket.yahoo.net/static-assets/flags/min/2.png",width: 60),
                    ),
                    Text("WI",style: _active),
                  ],
                ) 
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("223/5 (90.0) CRR: 2.47",style: _active)
                  ]
                )
              )
            ],
          ),
          Text("WI elected to bat",style:  _active.merge(TextStyle())) 
        ]
      )
    );

    Widget _currentBatsmen = Container(
      color: hexStringToColor("#2B295B"),
      padding: const EdgeInsets.only(top:15.0,bottom: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Nkrumaha Bonner*",style:_active),
              Text("74(124)",style:_active),
              Text("S/R: 42.77",style:_active)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Joshua Da Silva",style:_active),
              Text("22(46)",style:_active),
              Text("S/R: 47.82",style:_active)
            ],
          ),
        ],
      )
    );

    Widget _currentBowler = Container(
      color: hexStringToColor("#2B295B"),
      padding: const EdgeInsets.all(11.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child:Text("Tajul Islam",style:_active),
          ),
          Expanded(
            flex: 1,
            child:Text("2/64 (30)",style:_active),
          ),
        ],
      )
    );

    Widget _lastSixBalls = Container(
      color: hexStringToColor("#2B295B"),
      padding: const EdgeInsets.all(11.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
            Text("Last 6 Balls",style:_active.merge(TextStyle(fontWeight: FontWeight.w400))),
        ],
      )
    );

    Widget _feedContainer = Container(
      padding: const EdgeInsets.all(11.0),
      child: Text(
        "Earlier in the day, West Indies opted to bat first after winning the toss. Their openers almost kept the hosts at bay with Brathwaite and Campbell adding 66. Campbell fell but that was the only success for Bangladesh. However, they returned with more energy in the 2nd session to pull things back in their control. The medium-pacers did the job for them in that second session with Taijul making sure easy runs were not given from his end. Jayed got 2 while Sarkar managed the big wicket of Brathwaite.",
        softWrap: true,
      ),
    );

    return Container(
      child: ListView(
        children: [
          _breadCrums,
          _matchNameState,
          _matchStatusInfo,
          _matchTeamDetails,
          _currentBatsmen,
          _dividerLine,
          _currentBowler,
          _dividerLine,
          _lastSixBalls,
          _feedContainer,
          _feedContainer
        ],
      ),
    );
  }
}