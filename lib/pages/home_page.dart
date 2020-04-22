import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../drawer/nav_bar.dart';
import '../model/post_entity.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PostEntity> postList;
  @override
  void initState() {
    super.initState();
    http.get('https://jsonplaceholder.typicode.com/posts').then((result) {
      String body = result.body;
      dynamic json = jsonDecode(body);
      setState(() {
        postList = List();
        (json as List).forEach((item) {
          postList.add(PostEntity().fromJson(item));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (postList == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Dummy Api Lists'),
        ),
        drawer: Drawar(),
        body: Container(
          child: ListView.builder(
            itemBuilder: (_, int index) => EachList(this.postList[index]),
            itemCount: this.postList.length,
          ),
        ),
      );
    }
  }
}

class EachList extends StatelessWidget {
  PostEntity item;
  EachList(this.item);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width * 1.0,
          color: Colors.blueGrey,
          child: Column(
            children: <Widget>[
              Text(
                item.id.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Text(item.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15)),
              Text(item.body,
                  maxLines: 10,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10))
            ],
          )),
    );
  }
}
