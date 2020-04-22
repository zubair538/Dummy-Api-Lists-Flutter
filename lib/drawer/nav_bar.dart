import 'package:dummyapilist/pages/album_page.dart';
import 'package:dummyapilist/pages/comment_page.dart';
import 'package:dummyapilist/pages/home_page.dart';
import 'package:dummyapilist/pages/user_page.dart';
import 'package:flutter/material.dart';

class Drawar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(40.0),
        bottomRight: Radius.circular(40.0),
      ),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _createHeader(),
            _createDrawerItem(
              icon: Icons.local_post_office,
              text: 'Posts',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            _createDrawerItem(
                icon: Icons.comment,
                text: 'Comment',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CommentPage()),
                  );
                }),
            _createDrawerItem(
                icon: Icons.photo_album,
                text: 'Album',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AlbumPage()),
                  );
                }),
            Divider(),
            _createDrawerItem(
                icon: Icons.collections_bookmark,
                text: 'Users',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Userpage()),
                  );
                }),
            _createDrawerItem(icon: Icons.face, text: 'Authors'),
            _createDrawerItem(
                icon: Icons.account_box, text: 'Flutter Documentation'),
            _createDrawerItem(icon: Icons.stars, text: 'Useful Links'),
            Divider(),
            _createDrawerItem(icon: Icons.bug_report, text: 'Report an issue'),
            ListTile(
              title: Text('0.0.1'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

Widget _createHeader() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage('images/back.jpg'))),
      child: Stack(children: <Widget>[
        Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text("Dummy Api",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500))),
        Positioned(
          bottom: 35.0,
          left: 16.0,
          child: CircleAvatar(
              radius: 40, backgroundImage: AssetImage('images/zubair.jpg')),
        )
      ]));
}

Widget _createDrawerItem(
    {IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text),
        )
      ],
    ),
    onTap: onTap,
  );
}
