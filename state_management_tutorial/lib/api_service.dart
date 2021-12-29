import 'dart:convert';

import 'package:http/http.dart' as http;

import 'post_model.dart';

class ApiService {

  static final String _postUrl = "https://jsonplaceholder.typicode.com/posts";

  static Future<List<Post>> getData() async {
    try{
      var response = await http.get(Uri.parse(_postUrl));

      if(response.statusCode == 200 ) {

        var result = response.body;

        List data = json.decode(result);

        List<Post> _data = [];

        data.forEach((element) {
          Post _post = Post.fromJson(element);
          _data.add(_post);
        });


        return _data;
      }else {
        throw "Invalid Status code";
      }

    }catch(e) {
      print(e);
      throw "Something went wrong";
    }
  }

  Future postData() async {}

}