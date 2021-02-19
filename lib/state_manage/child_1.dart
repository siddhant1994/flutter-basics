import 'package:flutter/material.dart';
import 'package:flutter_application_1/state_manage/Notifiers/CounterNotifier.dart';
import 'package:provider/provider.dart';

class ChildOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("++childOne build method");
    return Container(
      child: Column(
          children: [
            const SizedBox(height: 30),
            Consumer<CounterNotifer>(
              builder: (context,counter,_){
                return RaisedButton(
                  onPressed: () {
                    int currentCount = counter.getCount;
                    currentCount = currentCount + 1;
                    counter.setCount(currentCount);
                  },
                  child: const Text('Increase from ChildOne', style: TextStyle(fontSize: 20)),
                );
              },
            ),
          ],
      ),
    );
  }
}