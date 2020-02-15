import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class Pg7KelasSaya extends StatefulWidget {
  final String contentUrl;
  Pg7KelasSaya(this.contentUrl);

  @override
  _Pg7KelasSayaState createState() => _Pg7KelasSayaState(this.contentUrl);
}

class _Pg7KelasSayaState extends State<Pg7KelasSaya> {
  String contentUrl = "";
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  _Pg7KelasSayaState(this.contentUrl);

  @override
  void initState() {
    contentUrl = widget.contentUrl;
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  Widget _infoTile(String title, String subtitle) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle ?? 'Not set'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kelas Saya"),
      ),
      body: Container(
        color: Colors.indigo,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              contentUrl.toString(),
              style: TextStyle(fontSize: 20),
            ),
            RaisedButton(
              onPressed: () {},
              child: Text("DEBUG"),
            ),
            _infoTile('App name', _packageInfo.appName),
            _infoTile('Package name', _packageInfo.packageName),
            _infoTile('App version', _packageInfo.version),
            _infoTile('Build number', _packageInfo.buildNumber),
          ],
        ),
      ),
    );
  }
}
