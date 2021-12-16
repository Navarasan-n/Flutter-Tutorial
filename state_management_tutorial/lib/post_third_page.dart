import 'package:flutter/material.dart';

class PostThirdPage extends StatefulWidget {
  const PostThirdPage({Key? key}) : super(key: key);

  @override
  _PostThirdPageState createState() => _PostThirdPageState();
}

class _PostThirdPageState extends State<PostThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Third"),),
      body: Center(
        child: Text("Data: "),
      ),
    );
  }
}
