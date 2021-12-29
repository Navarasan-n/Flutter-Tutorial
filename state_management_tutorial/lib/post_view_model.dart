import 'package:flutter/cupertino.dart';
import 'package:state_management_tutorial/post_model.dart';

import 'api_service.dart';

class PostViewModel extends ChangeNotifier {


  List<Post>? _posts;
  bool _loading = false;
  String? _error;

  List<Post>? get posts => _posts;
  bool get loading => _loading;
  String? get error => _error;

  // set setPosts(List<Post>? p) {
  //   _posts = p;
  //   notifyListeners();
  // }

  void setLoading(bool l) {
    _loading = l;
    notifyListeners();
  }

  void setError(String? err) {
    _error = err;
    notifyListeners();
  }

  getPost() async {

   try{
     _loading = true;
     _error = null;

     List<Post> _posts = await ApiService.getData();

     _posts = _posts;
     _loading = false;

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