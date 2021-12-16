import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {

  static final String _postUrl = "https://jsonplaceholder.typicode.com/posts";

  static Future<List> getData() async {
    try{
      var response = await http.get(Uri.parse(_postUrl));

      if(response.statusCode == 200 ) {

        var result = response.body;

        List data = json.decode(result);

        return data;
      }else {
        throw "Invalid Status code";
      }

    }catch(e) {
      throw "Something went wrong";
    }
  }

  Future postData() async {}

}