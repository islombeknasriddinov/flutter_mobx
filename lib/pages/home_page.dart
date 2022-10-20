import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_flutter/store/home_store.dart';
import '../views/item_of_post.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeStore store = HomeStore();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    store.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MobX"),
        ),
        body: Observer(
          builder: (_) => Stack(
            children: [
              ListView.builder(
                itemCount: store.items.length,
                itemBuilder: (ctx, index) {
                  return itemOfPost(store, store.items[index]);
                },
              ),
              store.isLoading
                  ? Center(
                child: CircularProgressIndicator(),
              )
                  : SizedBox.shrink(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
            // Respond to button press
          },
          child: Icon(Icons.add),
        ));
  }

}
