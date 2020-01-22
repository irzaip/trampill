import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Pg11_HubungiKami extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Hubungi Kami"),
      ),
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 30, 30, 30),
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text("Hubungi kami di"),
            new Text("email:"),
            new Text(""),
            new Text("irzaip@gmail.com"),
          ],
        ),
      )

    );
  }
}
