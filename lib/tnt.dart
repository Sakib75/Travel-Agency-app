import 'package:flutter/material.dart';
import 'contents.dart';
import 'components/Top.dart';
import 'components/bnav.dart';


TabController _controller;
class tnt extends StatefulWidget {
  @override
  _tntState createState() => _tntState();
}

class _tntState extends State<tnt> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 40,left: 20,right: 20,),
        child: Column(
          children: <Widget>[
            TopBar(),
            WelcomeBar(),
            contents(),
          ],

        ),
      ),
      bottomNavigationBar: bnav(),
    );
  }
}


