import 'package:flutter/material.dart';


class Pg22Setting extends StatefulWidget {
  @override
  _Pg22SettingState createState() => _Pg22SettingState();
}

class _Pg22SettingState extends State<Pg22Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Setting aplikasi"),),
      body: Column(
        children: <Widget>[
          Text("Settingan"),
        ],
      ),
    );
  }
}
