import 'package:flutter/material.dart';

class Pg3Lainnya extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: RaisedButton(
            color: Colors.blue,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.more),
            textColor: Colors.white,
          ),
          title: Text("Lainnya ..."),
        ),
        backgroundColor: Colors.indigo,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                RaisedButton(
                  onPressed: () {Navigator.pushNamed(context, '/pg22_setting');},
                  child: Text("SETTING APLIKASI"),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text("AKUN SAYA"),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/pg10_tentang');
                  },
                  child: Text("TENTANG KAMI"),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/pg11_hubungikami');
                  },
                  child: Text("HUBUNGI KAMI"),
                ),

                RaisedButton(onPressed: () { Navigator.pushNamed(context, '/pg12_cara');}, child: Text("CARA MEMBUAT KELAS")),
                RaisedButton(onPressed: () {Navigator.pushNamed(context, '/pg13_privasi');}, child: Text("PRIVASI")),
                RaisedButton(onPressed: (){Navigator.pushNamed(context, '/pg14_syaratketentuan');}, child: Text("SYARAT & KETENTUAN"),),
                RaisedButton(
                  onPressed: () { Navigator.pushNamed(context, '/pg23_tentangapp');},
                  child: Text("TENTANG APP INI"),
                ),
                SizedBox(
                  height: 30,
                ),
                RaisedButton(onPressed: () {}, child: Text("LOGIN")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
