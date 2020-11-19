import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FindRoomInfo extends StatefulWidget {
  @override
  _FindRoomInfoState createState() => _FindRoomInfoState();
}

class _FindRoomInfoState extends State<FindRoomInfo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: GestureDetector(
          child: Center(
            child: Text('asd'),
          ),
        ),
      ),
    );
  }
}