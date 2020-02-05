import 'package:flutter/material.dart';



class Pg7KelasSaya extends StatefulWidget {
  final String contentUrl;
  Pg7KelasSaya(this.contentUrl);

  @override
  _Pg7KelasSayaState createState() => _Pg7KelasSayaState(this.contentUrl);
}

class _Pg7KelasSayaState extends State<Pg7KelasSaya> {
  String contentUrl = "";

  _Pg7KelasSayaState(String ttl);

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
              onPressed: () { },
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
