import 'package:flutter/material.dart';



class Pg24Feedback extends StatefulWidget {
  @override
  _Pg24FeedbackState createState() => _Pg24FeedbackState();
}

class _Pg24FeedbackState extends State<Pg24Feedback> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Feedback")),
      body: Column(
        children: <Widget>[
          Text("Feedback anda sangat berarti buat kami"),
        ],
      ),
    );
  }
}
