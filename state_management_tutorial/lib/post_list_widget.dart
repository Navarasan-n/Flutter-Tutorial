
import 'package:flutter/material.dart';
import 'package:state_management_tutorial/post_model.dart';

class PostList extends StatelessWidget {
   PostList({Key? key, this.posts}) : super(key: key);

  final List<Post>? posts;

  @override
  Widget build(BuildContext context) {

    print(posts);

    return ListView.builder(
      itemCount: posts?.length,
      itemBuilder: (context, index) {
        Post post = posts![index];

        return Container(
          margin: EdgeInsets.all(10.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ListTile(
                title: Text("${post.title}"),
                subtitle: Text("${post.body}"),
                leading: CircleAvatar(child: Text("${post.id}")),
              ),
            ),
          ),
        );
      },
    );
  }
}
