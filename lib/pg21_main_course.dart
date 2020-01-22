import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const lightColor = Color(0xFFAAAAAA);
const darkColor = Color(0xFF1D1E33);

enum Sider { left, right }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color leftIcon = darkColor;
  Color rightIcon = darkColor;
  int height = 160;
  int berat = 90;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beranda'),
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
                TextSpan(text: ' WAWAWAorld!'),
              ],
            ),
          )
        ],
        ),
      );
  }
}

class Ikonik extends StatelessWidget {
  Ikonik({this.gambar, this.judul});

  final IconData gambar;
  final String judul;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          gambar,
          color: Colors.white,
          size: 60,
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          judul,
          style: TextStyle(fontSize: 18.0),
        )
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.bcolour, this.cardChild});

  final Color bcolour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: bcolour,
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}
