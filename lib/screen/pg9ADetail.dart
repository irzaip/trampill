import 'package:flutter/material.dart';
import 'package:trampill/services/Course.dart';

class Pg9ADetail extends StatefulWidget {
  final MasterMooc mmooc;

  Pg9ADetail(this.mmooc);

  @override
  _Pg9ADetailState createState() => _Pg9ADetailState();
}

class _Pg9ADetailState extends State<Pg9ADetail> {
  TextStyle fieldFont = TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700 );
  TextStyle bigFont = TextStyle(color: Colors.black, fontSize: 20, );
  TextStyle mediumfont = TextStyle(fontSize: 18, color: Colors.black);
  TextStyle deskripsifont = TextStyle(fontSize: 16, color: Colors.black);
  TextStyle kategorifont = TextStyle(fontSize: 16, color: Colors.blueGrey);
  TextStyle hargafont = TextStyle(
      fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.w700);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Detail"),),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            verticalDirection: VerticalDirection.down,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 14,),
              Text("JUDUL :", style: fieldFont),
              Text(widget.mmooc.title, style: bigFont,),
              SizedBox(height: 14, ),
              Text("DIBUAT :", style: fieldFont,),
              Text(widget.mmooc.oleh, style: mediumfont,),
              SizedBox(height: 14,),
              Text("KATEGORI :", style: fieldFont,),
              Text(widget.mmooc.kategori, style: kategorifont,),
              SizedBox(height: 14,),
              SizedBox(height: 14,),
              Text("DESKRIPSI :", style: fieldFont,),
              Text(widget.mmooc.deskripsi, style: deskripsifont,),
              SizedBox(height: 14,),
              SizedBox(height: 14,),
              Text("RATING :", style: fieldFont,),
              Text(widget.mmooc.rating, style: kategorifont,),
              SizedBox(height: 14,),
              Text("HARGA :", style: fieldFont,),
              Text(widget.mmooc.harga, style: hargafont,),
              SizedBox(height: 14,),
              Text("URL:", style: fieldFont,),
              Text(widget.mmooc.url, style: mediumfont,),

            ],
          ),
        ),
      ),
    );
  }
}
