import 'package:flutter/material.dart';
import 'package:flutter_application_1/state_manage/Notifiers/UserNotifer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/state_manage/Models/user.dart';
import "dart:math";

class ChildTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("++childTwo build method");
    List names = ['Mikasa','Eren','Armin','Levi','Jean'];
    List ages = [23,24,25,26,27];
    
    return Container(
      child: Column(
          children: [
            const SizedBox(height: 30),
            Consumer<UserNotifer>(
              builder: (context,user,_){
                return RaisedButton(
                  onPressed: () {
                    String _n = names[Random().nextInt(names.length)];
                    int _a = ages[Random().nextInt(ages.length)];
                    User newUser = User(age: _a,name: _n);
                    
                    user.setUser(newUser);
                  },
                  child: const Text('Create Random User', style: TextStyle(fontSize: 20)),
                );
              },
            ),
          ],
      ),
    );
  }
}