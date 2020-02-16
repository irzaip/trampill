import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';


class Pg11HubungiKami extends StatelessWidget {

  final String myText = """
  
# Pengembang.
### irzaip@gmail.com - Irza Pulungan
### asman13300045@gmail.com - M. Asman
### erisriso@gmail.com - Eris Riso
### alternative.xen@gmail.com - Riska Abdullah

  
  """;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hubungi Kami"),
      ),
      backgroundColor: Colors.indigo,
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 30, 30, 30),
        alignment: Alignment.topLeft,
        child: Markdown(data: myText),
        ),
      );


  }
}
