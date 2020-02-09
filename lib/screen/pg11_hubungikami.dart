import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';




class Pg11HubungiKami extends StatelessWidget {

  final String myText = """
  
# HUBUNGI KAMI.

### irzaip@gmail.com
### alternative.xen@gmail.com
### erisriso@gmail.com
### asman13300045@gmail.com
  
  """;
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
        child: Markdown(data: myText),
        ),
      );


  }
}
