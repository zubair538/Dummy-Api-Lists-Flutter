import 'package:dummyapilist/model/album_entity.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AlbumPage extends StatefulWidget {
  @override
  _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  List<AlbumEntity> albumList;
  @override
  void initState() {
    super.initState();
    http.get('https://jsonplaceholder.typicode.com/photos').then((result) {
      String body = result.body;
      dynamic json = jsonDecode(body);
      setState(() {
        albumList = List();
        (json as List).forEach((item) {
          albumList.add(AlbumEntity().fromJson(item));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (albumList == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        body: Container(
          child: ListView.builder(
            itemBuilder: (_, int index) => AlbumItem(this.albumList[index]),
            itemCount: albumList.length,
          ),
        ),
      );
    }
  }
}

class AlbumItem extends StatelessWidget {
  AlbumEntity albumEntity;

  AlbumItem(this.albumEntity);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          height: MediaQuery.of(context).size.height * 0.30,
          width: MediaQuery.of(context).size.width * 1.0,
          color: Colors.blue,
          child: Column(
            children: <Widget>[
              Text(
                albumEntity.title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image.network(
                    albumEntity.url,
                    width: 100,
                    height: 100,
                  ),
                  Image.network(
                    albumEntity.thumbnailUrl,
                    width: 100,
                    height: 100,
                  ),
                ],
              )
            ],
          )),
    );
  }
}
