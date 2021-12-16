import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_model.dart';
import 'main.dart';

class SecondScreen extends StatefulWidget {
  SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<CounterModel>(context);

    return Scaffold(
        appBar: AppBar(title: Text("Second Page")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Counter: ${model.counter}",
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      model.incrementCounter();
                    },
                    child: Text("Increment"),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      model.decrementCounter();
                    },
                    child: Text("Decrement"),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
