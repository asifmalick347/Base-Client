import 'package:base_client/models/post_model.dart';
import 'package:base_client/services/api_services.dart';

class TestController {
  List<PostModel> postModel = [];
  // get method //
  void getPosts() async {
    final response = await ApiServices().getData('/posts');
    for(var data in response){
      postModel.add(PostModel.fromJson(data));
    }
    print (postModel[0].title);
    if (response == null) return;
  }
}
