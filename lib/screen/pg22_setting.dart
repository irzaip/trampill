import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pg15_materi.dart';
import 'package:qrscan/qrscan.dart';
import 'package:simple_permissions/simple_permissions.dart';

class Pg22Setting extends StatefulWidget {
  @override
  _Pg22SettingState createState() => _Pg22SettingState();
}

class _Pg22SettingState extends State<Pg22Setting> {
  TextEditingController controller = TextEditingController(text: "https://raw.githubusercontent.com/irzaip/TrampillMasterMooc/master/Master.md");
  TextEditingController controller2 = TextEditingController(text: "");
  String defaultMasterMooc = 'https://raw.githubusercontent.com/irzaip/TrampillMasterMooc/master/Master.md';



  @override
  void initState() {
    super.initState();
    loadDefault();
  }

  Future<void> loadDefault() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    controller.text = pref.getString("MasterMooc");
    controller2.text = pref.getString("SpecialCourse");
  }

  void loadMM() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    controller.text = pref.getString("MasterMooc");
  }
  void saveMasterMooc() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("MasterMooc", controller.text);
  }

  void saveSpecialCourse() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("SpecialCourse", controller2.text);
  }

  void loadSpecialCourse() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    controller2.text = pref.getString("SpecialCourse");
  }

  void bukaSpecialCourse() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) =>
            Pg15Materi(controller2.text)
    ));
  }

  void getDefaultMM() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    controller.text = defaultMasterMooc;
    pref.setString("MasterMooc", controller.text);
  }

  void scanQR() async {
    bool result = await SimplePermissions.checkPermission(Permission.Camera);
    PermissionStatus status = PermissionStatus.notDetermined;
    if (!result) {
      status = await SimplePermissions.requestPermission(Permission.Camera);
    }
    if (result || status == PermissionStatus.authorized) {
          String scanResult = await scan();
          setState(() {
            controller.text = scanResult;
          });
        }
  }

  void scanQR2() async {
    bool result = await SimplePermissions.checkPermission(Permission.Camera);
    PermissionStatus status = PermissionStatus.notDetermined;
    if (!result) {
      status = await SimplePermissions.requestPermission(Permission.Camera);
    }
    if (result || status == PermissionStatus.authorized) {
      String scanResult = await scan();
      setState(() {
        controller2.text = scanResult;
      });
    }
  }


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
                    onPressed: (){
                      getDefaultMM();
                    },
                   child: Text("Default"),
                ),
                RaisedButton(
                  onPressed: (){
                    loadMM();
                  },
                  child: Text("LOAD"),
                ),

                RaisedButton(onPressed: (){scanQR();},
                child: Text("SCAN QR"),),
                RaisedButton(onPressed: (){
                  saveMasterMooc();
                },
                child: Text("SAVE"),),
                ],
              ),
                SizedBox(height: 40,),
                Text("BUKA KURSUS SPESIAL MELALUI URL:", style: TextStyle(color: Colors.white, fontSize: 18,),),
                TextField(
                  controller: controller2,
                ),
                Row(
                  children: <Widget>[
                    RaisedButton(onPressed: () {loadSpecialCourse();},
                    child: Text("LOAD"),),
                    RaisedButton(onPressed: (){scanQR2();},
                      child: Text("SCAN QR"),),
                    RaisedButton(onPressed: (){bukaSpecialCourse();},
                      child: Text("BUKA"),),
                    RaisedButton(onPressed: (){saveSpecialCourse();},
                      child: Text("SAVE"),),


                  ],
            )
          ],
        ),
      ),
    );
  }
}
