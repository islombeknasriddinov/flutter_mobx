import 'package:mobx/mobx.dart';

import '../model/post_model.dart';
import '../service/http_service.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store{
  @observable bool isLoading = false;
  @observable List<Post> items = [];

  Future apiPostList() async {
    isLoading = true;
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null) {
      items = Network.parsePostList(response);
    } else {
      items = [];
    }
    isLoading = false;
  }


  Future<bool> apiPostDelete(Post post) async {
    isLoading = true;
    var response = await Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    items.removeAt(items.length-1);

    isLoading = false;

    return response != null;
  }
}