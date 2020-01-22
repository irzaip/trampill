import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Pg10_Tentang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Tentang kami'),
      ),
      body: Column(
          children: <Widget>[
            Text("Hello"),
            RichText(
              text: TextSpan(
                text: 'Hello ',
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(text: 'bold', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ' world!'),
                ],
              ),
            )
          ],
      ),
    );
  }
}
