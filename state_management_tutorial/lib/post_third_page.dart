import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_tutorial/post_list_widget.dart';
import 'package:state_management_tutorial/post_model.dart';
import 'package:state_management_tutorial/post_view_model.dart';

class PostThirdPage extends StatefulWidget {
  const PostThirdPage({Key? key}) : super(key: key);

  @override
  _PostThirdPageState createState() => _PostThirdPageState();
}

class _PostThirdPageState extends State<PostThirdPage> {

  // List<Post> _posts = [
  //   Post(
  //     id: 1,
  //     title: "My title",
  //     body: "Custom Body property",
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
     final model = Provider.of<PostViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Third"),),
      body: PostList(posts: model.posts),
    );
  }
}
