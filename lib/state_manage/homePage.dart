import 'package:flutter/material.dart';
import 'package:flutter_application_1/state_manage/Notifiers/CounterNotifier.dart';
import 'package:flutter_application_1/state_manage/Notifiers/UserNotifer.dart';
import 'package:flutter_application_1/state_manage/child_1.dart';
import 'package:flutter_application_1/state_manage/child_2.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // Timer(Duration(seconds: 3), (){
    //   print("adding new user");
    //   User newUser = User(age: 31,name: "Reddic");
    //   Provider.of<UserNotifer>(context,listen: false).setUser(newUser);
    // });

    void _incrementCounter(){
      int currentCount = Provider.of<CounterNotifer>(context,listen: false).getCount;
      currentCount = currentCount+1;
      Provider.of<CounterNotifer>(context,listen: false).setCount(currentCount);
    }

    /**
    * listen false == provider wont listen for any changes
    * listen true == will listern to all notify changes and will run build method
    * to void that use Consumer class
    */
    int _directCounter =  Provider.of<CounterNotifer>(context,listen: false).getCount;

    print("++running the build++");

    return Scaffold(
      appBar: AppBar(title: Text("Test Provider")),
      body: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<CounterNotifer>(
              builder:(context,counter,child){
                return Column(
                  children: [
                    Text("OnHomePage With Consumer for Counter"),
                    Text(counter.getCount.toString()),
                  ],
                );
              } 
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Consumer<UserNotifer>(
              builder:(context,user,child){
                return Column(
                  children: [
                    Text("OnHomePage With Consumer for User"),
                    Text(user.getCurrentUser?.name ?? 'No User added yet'),
                    Text(user.getCurrentUser?.age?.toString() ?? 'No User added yet'),
                  ],
                );
              } 
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Column(
                  children: [
                    Text("OnHomePage With direct provider"),
                    Text(_directCounter.toString()),
                  ],
            ),
            ChildOne(),
            ChildTwo()
          ]
        ) 
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment from homePage',
        child: Icon(Icons.add),
      ),
    );
  }
}