import 'package:dummyapilist/model/user_entity.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Userpage extends StatefulWidget {
  @override
  _UserpageState createState() => _UserpageState();
}

class _UserpageState extends State<Userpage> {
  List<UserEntity> userList;
  @override
  void initState() {
    super.initState();
    http.get('https://jsonplaceholder.typicode.com/photos').then((result) {
      String body = result.body;
      dynamic json = jsonDecode(body);
      setState(() {
        userList = List();
        (json as List).forEach((item) {
          userList.add(UserEntity().fromJson(item));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (userList == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        body: Container(
          child: ListView.builder(
            itemBuilder: (_, int index) => UserItem(this.userList[index]),
            itemCount: userList.length,
          ),
        ),
      );
    }
  }
}

class UserItem extends StatelessWidget {
  UserEntity item;
  UserItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                height: MediaQuery.of(context).size.height * 0.30,
                width: MediaQuery.of(context).size.width * 1.0,
                color: Colors.blue,
                child: Column(
                  children: <Widget>[
                    Text(
                      item.id.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),

//                    Text(
//                      item.username,
//                      style: TextStyle(
//                          color: Colors.white,
//                          fontWeight: FontWeight.bold,
//                          fontSize: 20),
//                    ),
//                    Text(
//                      item.email,
//                      style: TextStyle(
//                          color: Colors.white,
//                          fontWeight: FontWeight.bold,
//                          fontSize: 20),
//                    ),
//                        Row(
//                          children: <Widget>[
//                            Text(userEntity.address.street,
//                                style: TextStyle(
//                                    fontSize: 10, fontWeight: FontWeight.bold)),
//                            Text(userEntity.address.suite,
//                                style: TextStyle(
//                                    fontSize: 10, fontWeight: FontWeight.bold)),
//                          ],
                    // ),
//                        Row(children: <Widget>[
//                          Text(userEntity.address.city,
//                              style: TextStyle(
//                                  fontSize: 10, fontWeight: FontWeight.bold)),
//                          Text(userEntity.address.zipcode,
//                              style: TextStyle(
//                                  fontSize: 10, fontWeight: FontWeight.bold)),
//                        ]),
//                        Row(children: <Widget>[
//                          Text(userEntity.address.geo.lat,
//                              style: TextStyle(
//                                  fontSize: 10, fontWeight: FontWeight.bold)),
//                          Text(userEntity.address.geo.lng,
//                              style: TextStyle(
//                                  fontSize: 10, fontWeight: FontWeight.bold)),
//                        ]),
//                        Row(
//                          children: <Widget>[
//                            Text(userEntity.company.name,
//                                style: TextStyle(
//                                  fontSize: 10,
//                                  fontWeight: FontWeight.bold,
//                                )),
//                            Text(userEntity.company.catchPhrase,
//                                style: TextStyle(
//                                  fontSize: 10,
//                                  fontWeight: FontWeight.bold,
//                                )),
//                            Text(userEntity.company.bs,
//                                style: TextStyle(
//                                  fontSize: 10,
//                                  fontWeight: FontWeight.bold,
//                                )),
//                          ],
//                        )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
