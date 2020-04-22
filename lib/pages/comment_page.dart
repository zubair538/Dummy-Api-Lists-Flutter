import 'package:dummyapilist/model/comment_entity.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CommentPage extends StatefulWidget {
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  List<CommentEntity> commentList;
  @override
  void initState() {
    super.initState();
    http.get('https://jsonplaceholder.typicode.com/comments').then((result) {
      String body = result.body;
      dynamic json = jsonDecode(body);
      setState(() {
        commentList = List();
        (json as List).forEach((item) {
          commentList.add(CommentEntity().fromJson(item));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (commentList == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        body: Container(
          child: ListView.builder(
            itemBuilder: (_, int index) => CommentItem(this.commentList[index]),
            itemCount: this.commentList.length,
          ),
        ),
      );
    }
  }
}

class CommentItem extends StatelessWidget {
  CommentEntity commentItem;
  CommentItem(this.commentItem);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width * 1.0,
          color: Colors.greenAccent,
          child: Column(
            children: <Widget>[
              Text(
                commentItem.name,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Text(commentItem.email,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15)),
              Text(commentItem.body,
                  maxLines: 10,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 10))
            ],
          )),
    );
  }
}
