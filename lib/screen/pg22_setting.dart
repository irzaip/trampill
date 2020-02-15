import 'package:flutter/material.dart';

class Pg22Setting extends StatefulWidget {
  @override
  _Pg22SettingState createState() => _Pg22SettingState();
}

class _Pg22SettingState extends State<Pg22Setting> {
  TextEditingController controller = TextEditingController(text: "");
  TextEditingController controller2 = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Setting aplikasi"),),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20,),
            Text("BUKA URL MASTERMOOC:", style: TextStyle(color: Colors.white, fontSize: 18),),
            TextField(
              controller: controller,
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                    onPressed: (){},
                   child: Text("Default"),
                ),
                RaisedButton(onPressed: (){},
                child: Text("SCAN QR Code"),),
                RaisedButton(onPressed: (){},
                child: Text("SAVE"),),
                ],
              ),
                SizedBox(height: 40,),
                Text("BUKA KURSUS SPESIAL MELALUI URL:", style: TextStyle(color: Colors.white, fontSize: 18,),),
                TextField(
                  controller: controller,
                ),
                Row(
                  children: <Widget>[
                    RaisedButton(onPressed: (){},
                      child: Text("SCAN QR Code"),),
                    RaisedButton(onPressed: (){},
                      child: Text("BUKA"),),
                    RaisedButton(onPressed: (){},
                      child: Text("SAVE"),),


                  ],
            )
          ],
        ),
      ),
    );
  }
}
