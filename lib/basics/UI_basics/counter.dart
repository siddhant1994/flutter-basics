import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void increment(){
    setState(() {
      _counter = _counter + 10; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Row(
          children:<Widget>[
              ElevatedButton(
                onPressed: increment,
                child: Text('Increment'),
              ),
              Text('Count: $_counter'),
          ],
        ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.grey
      ),
      home: Scaffold(
        body: Counter()
      )
    )
  );
}