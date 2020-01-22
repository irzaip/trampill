import 'package:flutter/material.dart';
import 'package:trampill/pg11_hubungikami.dart';
import 'pg3_Lainnya.dart';
import 'package:trampill/pg3_Lainnya.dart';
import 'pg21_main_course.dart';
import 'pg10_tentang.dart';
import 'pg15_materi.dart';
import 'pg11_hubungikami.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0A0A),
        scaffoldBackgroundColor: Color(0xFF0A0A0A),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyStatefulWidget(),
        '/pg3_lainnya': (context) => Pg3_Lainnya(),
        '/pg10_tentang': (context) => Pg10_Tentang(),
        '/pg11_hubungikami': (context) => Pg11_HubungiKami(),
        '/pg15_materi': (context) => Pg15_Materi(),
        '/pg21_main_course': (context) => InputPage()
      },
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Lainnya',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 3) {
        Navigator.pushNamed(context, '/pg3_lainnya');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          RaisedButton(
            child: Icon(Icons.search),
          ),
        ],
        backgroundColor: Colors.indigo,
        title: const Text('Trampill'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            MyCard(),
            Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.indigo,
            icon: Icon(Icons.home),
            title: Text('Beranda'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.indigo,
            icon: Icon(Icons.school),
            title: Text('Belajar'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.indigo,
            icon: Icon(Icons.ev_station),
            title: Text('Pembayaran'),
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.indigo,
              icon: Icon(Icons.more_horiz),
              title: Text('Lainnya')),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

// This is the stateless widget that the main application instantiates.
class MyCard extends StatelessWidget {
  MyCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        borderOnForeground: true,
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.blur_on, color: Colors.blueAccent,size: 40,),
              title: Text(
                'KECERDASAN BUATAN - Informal',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              subtitle: Text('oleh Irza Pulungan',
                  style: TextStyle(
                    color: Colors.grey ,
                    fontSize: 14,
                  )),

            ),
            ButtonBar(
              children: <Widget>[
                RaisedButton(
                  color: Colors.blue,
                  child: const Text('DETIL',
                  style: TextStyle(color: Colors.white),),
                  onPressed: () {/* ... */},
                ),
                RaisedButton(
                  color: Colors.deepOrangeAccent,
                  child: const Text('MASUK',
                  style: TextStyle(color: Colors.white),),
                  onPressed: () {
                    Navigator.pushNamed(context, '/pg15_materi');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
