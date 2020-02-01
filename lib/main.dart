import 'package:flutter/material.dart';
import 'package:trampill/screen/pg11_hubungikami.dart';
import 'screen/pg3_Lainnya.dart';
import 'package:trampill/screen/pg3_Lainnya.dart';
import 'screen/pg21_main_course.dart';
import 'screen/pg10_tentang.dart';
import 'screen/pg15_materi.dart';
import 'screen/pg11_hubungikami.dart';

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
      body: MyCard(),
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

class MyCard extends StatefulWidget {
  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  Map sampleCourse = {
    '1': [
            "KECERDASAN BUATAN - Informal",
            "oleh Irza Pulungan",
            "Belajar kecerdasan buatan dan hal-hal yang berkaitan dengan Machine learning, Jaringan Syaraf Tiruan dan Deep Learning",
            "Teknologi, Programming"
            "Gratis",
            4.8
         ],

    '2': [
            "Programming dengan Flutter",
            "oleh ABC",
            "Belajar menggunakan aplikasi Flutter",
            "Teknologi, Programming",
            "Gratis",
            4.5,
         ],
  };


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: new ListView.builder(
          itemCount: 7,
          itemBuilder: (BuildContext context, int index) => buildCourse(context, index)
      )
    );
  }


  Widget buildCourse(BuildContext context, int index) {
    TextStyle bigfont = TextStyle(fontSize: 25, color: Colors.black);
    TextStyle mediumfont = TextStyle(fontSize: 20, color: Colors.black);
    TextStyle kategorifont = TextStyle(fontSize: 20, color: Colors.black);
    TextStyle hargafont = TextStyle(fontSize: 20, color: Colors.black);
    return new Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {Navigator.pushNamed(context, "/pg15_materi");},
          child: Card(
            elevation: 10,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.ac_unit, color: Colors.black, size: 50,),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: <Widget>[
                        Text("Kecerdasan buatan - Informal", style: bigfont, textAlign: TextAlign.start,),
                        Text("oleh Irza Pulungan", style: mediumfont, textAlign: TextAlign.left,),
                        Text("teknologi, programming", style: kategorifont,),
                        Text("Gratis",style: hargafont,),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.accessibility, color: Colors.black, size: 60),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    
  }
}
