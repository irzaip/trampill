import 'package:flutter/material.dart';


class Pg3Lainnya extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        appBar: AppBar(
          leading: RaisedButton(
            color: Colors.blue,
            onPressed: () {Navigator.pop(context);},
            child: Icon(
                Icons.more),
          textColor: Colors.white,),
          title: Text("Lainnya ..."),
        ),
        backgroundColor: Colors.indigo,
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 70,),
                  Text("Pilih salah satu"),
                  Container(
                    width: 300,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text("Akun Saya"),
                    ),
                  ),
                Container(
                  width: 300,
                  child: RaisedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/pg10_tentang');
                    },
                    child: Text("Tentang kami"),
                  ),
                ),
              Container(
                width: 300,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/pg11_hubungikami');
                  },
                    child: Text("Hubungi kami"),
                ),
              ),
              Container(
                width: 300,
                child: RaisedButton(
                  onPressed: () {},
                    child: Text("Cara membuat kelas")
                ),
              ),
              Container(
                width: 300,
                child: RaisedButton(
                  onPressed: () {},
                    child: Text("Privasi")
                ),
              ),
              SizedBox(height: 30,),
              Container(
                width: 300,
                child: RaisedButton(
                  onPressed: () {},
                    child: Text("LOGIN")
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
