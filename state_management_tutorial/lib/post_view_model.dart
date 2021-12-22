import 'package:flutter/cupertino.dart';
import 'package:state_management_tutorial/post_model.dart';

import 'api_service.dart';

class PostViewModel extends ChangeNotifier {
  List<Post>? posts;
  bool loading = false;
  String? error;

  void setLoading(bool l) {
    loading = l;
    notifyListeners();
  }

  void setError(String? err) {
    error = err;
    notifyListeners();
  }

  getPost() async {

   try{
     setLoading(true);
     setError(null);

     List<Post> _posts = await ApiService.getData();

     setLoading(false);

     posts = _posts;

     notifyListeners();

     print(posts);

   }catch (e) {
     if(e is String)
      setError(e);
     else
       setError("Something went wrong");
   }

  }

}