import 'package:flutter/material.dart';


class Pg8Pembelian extends StatefulWidget {
  @override
  _Pg8PembelianState createState() => _Pg8PembelianState();
}

class _Pg8PembelianState extends State<Pg8Pembelian> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(title: Text("Pembelian saya")),
      body: SafeArea(child: Container(
        color: Colors.indigo,
        child: Column(
          children: <Widget>[
            Text("Masih dalam tahap konstruksi.")
          ],
        ),
      ))
    );
  }
}
