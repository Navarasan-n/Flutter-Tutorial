import 'package:flutter/material.dart';
import 'package:flutter_tutorial/post.dart';
import 'package:flutter_tutorial/timer_page.dart';

import 'api_service.dart';

class PostDetailPage extends StatefulWidget {
  const PostDetailPage({Key key, this.postId}) : super(key: key);

  final int postId;

  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  // Post post;
  Future<Post> _postDetailFuture;

  @override
  void initState() {
    _postDetailFuture = ApiService.getPost(widget.postId);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ID: ${widget.postId}"),
      ),
      body: FutureBuilder(
        future: _postDetailFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {

          if(snapshot.hasData) {
            print(snapshot.data);

            return _bodyUI(snapshot.data);
          }

          if(snapshot.hasError) {
            return Center(child: Text(snapshot.error),);
          }


          return Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }


  Widget _bodyUI(Post post) {

    if(post == null) return Container();

    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "ID: ${post.id}",
            style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15.0),
          Text(
            post.body,
            style: TextStyle(fontSize: 15.0, color: Colors.grey),
          ),
          SizedBox(height: 15.0),
          ElevatedButton(
            onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => TimerPage()));
              // Navigator.pop(context);
            },
            child: Text("Back"),
          ),
        ],
      ),
    );
  }
}
