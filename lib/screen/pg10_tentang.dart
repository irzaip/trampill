import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class Pg10Tentang extends StatelessWidget {
  final String _markdownData = """

# SIAPA KAMI?
Kami berangkat dari sebuah komunitas pembelajaran kecerdasan buatan INDOSOAI, komunitas kami berusaha untuk memajukan pendidikan di Indonesia dengan bantuan tools-tools moderen seperti apps, dan AI.

bergabunglah di komunitas kami di:

##  https://docs.google.com/forms/d/e/1FAIpQLSeqj1oG-nU2Vp1gsOjf9BTFZ1LXU_K2Uz0IoRTv4ckeGonIbw/viewform  

""";

  String url = 'https://docs.google.com/forms/d/e/1FAIpQLSeqj1oG-nU2Vp1gsOjf9BTFZ1LXU_K2Uz0IoRTv4ckeGonIbw/viewform';

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Tentang kami'),
      ),
      body: Container(
        color: Colors.indigo,
        child: SafeArea(
          child: ListView(
            children: <Widget>[Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset('images/INDOSOAI_sml.png', fit: BoxFit.fitWidth,
                ),
                RaisedButton(
                    onPressed: () {_launchURL();},
                    child: Text("KLIK DISINI UNTUK BERGABUNG")),
                Container(
                  height: 300,
                   child: Markdown(
                    controller: controller,
                    selectable: true,
                    data: _markdownData,
                    imageDirectory: 'https://raw.githubusercontent.com',
                  ),
                ),

              ],
            ),
    ],
          ),
        ),
      ),
    );
  }
}

_launchURL() async {
  const url = 'https://docs.google.com/forms/d/e/1FAIpQLSeqj1oG-nU2Vp1gsOjf9BTFZ1LXU_K2Uz0IoRTv4ckeGonIbw/viewform';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}