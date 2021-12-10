// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_tutorial/post.dart';
import 'package:flutter_tutorial/post_detail.dart';

import 'api_service.dart';
import 'main.dart';

class LayoutScreen extends StatefulWidget {
  LayoutScreen({Key key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  List<Post> _todos;


  @override
  void initState() {
    ApiService.getData().then((List<Post> value) {
      setState(() {
        _todos = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Example"),
      ),
      body: Container(
        child: ListView(
            children: _todos != null
                ? _todos.map((todo) => _buildTodo(todo, context)).toList()
                : [],
        ),
      ),
    );
  }

  Widget _buildTodo(Post todo, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        child: ListTile(
          onTap: (){

            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PostDetailPage(post: todo)));
            _showMyDialog(context, todo);
          },
          title: Text(
            todo.title,
            style: TextStyle(fontSize: 19.0),
          ),
          leading: Icon(Icons.add),
          trailing: Text(
            todo.id.toString(),
            style: TextStyle(fontSize: 19.0, color: Colors.green),
          ),
        ),
      ),
    );
  }


  Future<void> _showMyDialog(BuildContext context, Post todo) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(todo.title),
          content: Text(todo.body),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {

                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PostDetailPage(postId: todo.id)));
              },
            ),
          ],
        );
      },
    );
  }
}
