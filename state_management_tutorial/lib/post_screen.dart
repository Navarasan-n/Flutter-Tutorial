import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_tutorial/post_second_page.dart';
import 'package:state_management_tutorial/post_view_model.dart';
import 'package:state_management_tutorial/second_page.dart';

import 'api_service.dart';
import 'post_list_widget.dart';
import 'post_model.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  // late Future<List<Post>> _getDataFuture;

  @override
  void initState() {
    super.initState();

    // _getDataFuture = ApiService.getData();

    Provider.of<PostViewModel>(context, listen: false).getPost();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<PostViewModel>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Posts"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PostSecondPage()));
              },
              icon: Icon(Icons.navigate_next),
            )
          ],
        ),
        body: _body(model),
        // body: FutureBuilder(
        //   future: _getDataFuture,
        //   builder: (context, AsyncSnapshot<List<Post>> snapshot) {
        //     if (snapshot.hasData) {
        //       return PostList(posts: snapshot.data);
        //     }
        //
        //     if (snapshot.hasError) {
        //       return Center(child: Text("Data ${snapshot.error}"));
        //     }
        //
        //     return Center(child: CircularProgressIndicator());
        //   },
        // ),
    );
  }

  Widget _body(PostViewModel model) {

    if(model.loading) {
      return Center(child: CircularProgressIndicator());
    }

    if(model.error != null) {
      return Center(child: Text("${model.error}"));
    }

    // return Center(child: Text("${model.posts?.length}"),);

    return  PostList(posts: model.posts);
  }

}
