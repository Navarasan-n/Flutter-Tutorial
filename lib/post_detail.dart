import 'package:flutter/material.dart';
import 'package:flutter_tutorial/post.dart';

class PostDetailPage extends StatelessWidget {
  const PostDetailPage({Key key, this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("ID: ${post.id}", style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold),),
            SizedBox(height: 15.0),
            Text(post.body, style: TextStyle(fontSize: 15.0, color: Colors.grey),),

          ],
        ),
      ),
    );
  }
}
