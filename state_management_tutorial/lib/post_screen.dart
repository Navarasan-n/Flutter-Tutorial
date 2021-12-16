import 'package:flutter/material.dart';
import 'package:state_management_tutorial/post_second_page.dart';

import 'api_service.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  late Future<List> _getDataFuture;

  @override
  void initState() {
    _getDataFuture = ApiService.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Posts"),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: _getDataFuture,
          builder: (context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Data ${snapshot.data?.length}"),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PostSecondPage()));
                      },
                      child: Text("Go to second page"))
                ],
              ));
            }

            if (snapshot.hasError) {
              return Center(child: Text("Data ${snapshot.error}"));
            }

            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
