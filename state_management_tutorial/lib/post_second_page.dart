import 'package:flutter/material.dart';
import 'package:state_management_tutorial/post_third_page.dart';

class PostSecondPage extends StatefulWidget {
  const PostSecondPage({Key? key}) : super(key: key);

  @override
  _PostSecondPAgeState createState() => _PostSecondPAgeState();
}

class _PostSecondPAgeState extends State<PostSecondPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second"),),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PostThirdPage()));
          },
          child: Text("Go to third PAge"),
        ),
      ),
    );
  }
}
