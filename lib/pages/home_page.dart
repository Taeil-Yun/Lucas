import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:Fi_room/pages/find_room.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
      ),
      body: Center(
        child: FlatButton(
          child: Text('map'),
          onPressed: () {
            Navigator.of(context).push(_findRoomTransition());
          },
        ),
      ),
    );
  }
}

// move to page effect
Route _findRoomTransition() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => FindRoomInfo(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}