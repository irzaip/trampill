import 'package:flutter/material.dart';
import 'package:trampill/services/request.dart';
import 'package:trampill/services/Course.dart';

class Pg7_KelasSaya extends StatefulWidget {
  final String contentUrl;
  Pg7_KelasSaya(this.contentUrl);

  @override
  _Pg7_KelasSayaState createState() => _Pg7_KelasSayaState(this.contentUrl);
}

class _Pg7_KelasSayaState extends State<Pg7_KelasSaya> {
  String contentUrl = "";

  _Pg7_KelasSayaState(String ttl);
@override
  void initState() {
    contentUrl = widget.contentUrl;
    // TODO: implement initState
    super.initState();
  }

  String mystring = "This is my string";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kelas Saya"),
      ),
      body: Container(
        color: Colors.indigo,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Maaf masih dalam konstruksi.",
              style: TextStyle(fontSize: 20),
            ),
            RaisedButton(
              onPressed: () {
                var mycrs = Course();
                var result = mycrs.readurl("https://raw.githubusercontent.com/irzaip/SampleCourse/master/KecerdasanBuatan.md");
                },
              child: Text("DEBUG"),
            ),
            Text(
              mystring,
              style: TextStyle(fontSize: 20),
            ),
            Text(contentUrl),
          ],
        ),
      ),
    );
  }
}
