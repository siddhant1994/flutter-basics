import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(            
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            ImageBanner(),
            TitleSection(),
            ButtonSection(),
            textSection
          ],
        ),
      ), 
      theme: ThemeData( 
        primaryColor: Colors.blueGrey,
      )           
    );
  }
}


class ImageBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Image.asset(
          "images/bg.jpeg",
          width: 600,            
          height: 240,            
          fit: BoxFit.cover,
        ),
    );
  }
}

class TitleSection extends StatelessWidget {
  final _mainTitleStyle = TextStyle(fontFamily: 'ubuntu',fontSize: 20,fontWeight: FontWeight.w400);
  final _locationStyle = TextStyle(fontFamily: 'ubuntu',fontSize: 16,fontWeight: FontWeight.normal,color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Row(
        children : [
          Expanded(child: 
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text("Oeschinen Lake Campground Campground" ,style: _mainTitleStyle),
                ),
                Text("Kandersteg, Switzerland",style: _locationStyle),
              ]
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41'),
        ]
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _button(Colors.blue[500],Icons.call,"CALL"),
          _button(Colors.blue[500],Icons.near_me,"ROUTE"),
          _button(Colors.blue[500],Icons.share,"SHARE"),
        ],
      ),
    );
  }
}

Column _button(Color color, IconData icon, String label){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(icon,color: color),
      Text(
        label,
        style: TextStyle(
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.w400
          )
        )
    ]
  );
}


Widget textSection = Container(
  padding: const EdgeInsets.all(32),
  child: Text(
    'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
    softWrap: true,
  ),
);
