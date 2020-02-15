import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:device_id/device_id.dart';

class Pg23TentangApp extends StatefulWidget {
  @override
  _Pg23TentangAppState createState() => _Pg23TentangAppState();
}

class _Pg23TentangAppState extends State<Pg23TentangApp> {
  String device_Id = "";

  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
    getDevice();
  }

  Future<void> getDevice() async {
    device_Id = await DeviceId.getID;
  }
  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  Widget _infoTile(String title, String subtitle) {
    return ListTile(
      title: Text(title, style: TextStyle(fontSize: 20),),
      subtitle: Text(subtitle ?? 'Not set', style: TextStyle(fontSize: 18),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(title: Text("Tentang App ini")),
      body: Column(
        children: <Widget>[
          _infoTile("Device id", device_Id),
          _infoTile('App name', _packageInfo.appName),
          _infoTile('Package name', _packageInfo.packageName),
          _infoTile('App version', _packageInfo.version),
          _infoTile('Build number', _packageInfo.buildNumber),
        ],
      ),

    );
  }
}

