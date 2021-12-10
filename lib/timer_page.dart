import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key key}) : super(key: key);

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  StreamController controller = StreamController();
  Stream stream;
  int count = 0;
  int negativeCount = 0;

  @override
  void initState() {
    stream = controller.stream;

    stream.listen((event) {
      count += event;
      print(count);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timer"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "1",
            style: TextStyle(fontSize: 26.0),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              controller.add(1);
            },
            child: Text("Add"),
          ),
          ElevatedButton(
            onPressed: () {
              controller.add(-1);
            },
            child: Text("Subtract"),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.add(1);
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
