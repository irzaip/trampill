import 'package:flutter/material.dart';
import 'package:trampill/screen/pg11_hubungikami.dart';
import 'package:trampill/screen/pg7_kelassaya.dart';
import 'package:trampill/services/Course.dart';
import 'screen/pg3_Lainnya.dart';
import 'package:trampill/screen/pg3_Lainnya.dart';
import 'screen/pg21_main_course.dart';
import 'screen/pg10_tentang.dart';
import 'screen/pg15_materi.dart';
import 'screen/pg11_hubungikami.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';
  final String mm = "test";
  final String defaultCourseUrl = "https://raw.githubusercontent.com/irzaip/SampleCourse/master/KecerdasanBuatan.md";

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
        '/pg15_materi': (context) => Pg15_Materi(defaultCourseUrl),
        '/pg21_main_course': (context) => InputPage(),
        '/pg7_kelassaya': (context) => Pg7_KelasSaya(mm),
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

      if (_selectedIndex == 1) {
        Navigator.pushNamed(context, "/pg7_kelassaya");
      }
      if (_selectedIndex == 2) {
        print("Hello");
      }
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
          RaisedButton(
            child: Icon(Icons.settings),
          )
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

  var defUrlMasterMooc = "https://raw.githubusercontent.com/irzaip/TrampillMasterMooc/master/Master.md";
  List<masterMooc> courseList = new List<masterMooc>();

//  List<masterMooc> courseList = [
//    masterMooc(
//      "KECERDASAN BUATAN - Informal",
//      "oleh Irza Pulungan",
//      "Teknologi, Programming",
//      "Belajar kecerdasan buatan dan hal-hal yang berkaitan dengan Machine learning, Jaringan Syaraf Tiruan dan Deep Learning",
//      "Gratis",
//      "4.8",
//      "",
//    ),
//    masterMooc(
//      "Belajar membuat Website menggunakan Lavarel",
//      "oleh lavindo",
//      "Teknologi, Programming",
//      "Buat Website yang sangat kustom dengan kebutuhan kamu semua.",
//      "Gratis",
//      "4.3",
//      "",
//    ),
//    masterMooc(
//      "Programming dengan Flutter",
//      "oleh ABC",
//      "Teknologi, Programming",
//      "Belajar menggunakan aplikasi Flutter",
//      "Gratis",
//      "4.5",
//      "",
//    ),
//  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readurl(defUrlMasterMooc);
  }

  Future readurl(String url) async {
    //var client = http.Client();
    http.Response response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    var mooccontent = response.body;

    if (response.statusCode == 200) {
      RegExp regx = new RegExp(r'(#+)(.*)'); // get the headers
      RegExp regurl = new RegExp(r'\((http.*)\)'); // get urls

      var titles = regx.allMatches(mooccontent);
      var urls = regurl.allMatches(mooccontent);

      // check apakah mooc mempunyai URL dan judul 3 lapis?
      if (urls.length * 6 == titles.length && urls.length != 0) {
        // print("Mooc OK!.");
        // print(urls.length);

        var elm = 0; // start element 0
        for (var i = 0; i < urls.length; i = i + 1) {
          var judul = titles.elementAt(elm).group(2).toString();
          var oleh = titles.elementAt(elm + 1).group(2).toString();
          var kategori = titles.elementAt(elm + 2).group(2).toString();
          var deskripsi = titles.elementAt(elm + 3).group(2).toString();
          var harga = titles.elementAt(elm + 4).group(2).toString();
          var rating = titles.elementAt(elm + 5).group(2).toString();
          var url = urls.elementAt(i).group(1).toString();

          // tambahkan sejumlah field yang tersedia !
          elm=elm+6;
          courseList.add(new masterMooc(
              judul,
              oleh,
              kategori,
              deskripsi,
              harga,
              rating,
              url));
        }

        setState(() {});
      } else {
        print("MOOC MASTER COURSE READ - ERROR!");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: new ListView.builder(
        itemCount: courseList.length,
          itemBuilder: (BuildContext context , int index) =>  buildCourse(context, index, courseList[index])
      ),
    );
  }

  Widget buildCourse(BuildContext context, int index, masterMooc courseList) {
    final course = courseList;
    TextStyle bigfont = TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
    TextStyle mediumfont = TextStyle(fontSize: 18, color: Colors.black);
    TextStyle deskripsifont = TextStyle(fontSize: 16, color: Colors.black);
    TextStyle kategorifont = TextStyle(fontSize: 14, color: Colors.blueGrey);
    TextStyle hargafont = TextStyle(
        fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.w700);
    return new Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/pg15_materi");
          },
          child: Card(
            elevation: 10,
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.ac_unit,
                    color: Colors.black,
                    size: 50,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Flexible(
                                child: Text(
                              course.title,
                              style: bigfont,
                            )),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              course.oleh,
                              style: mediumfont,
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              course.kategori,
                              style: kategorifont,
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Flexible(
                                child: Text(
                              course.deskripsi,
                              style: deskripsifont,
                            )),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              course.harga,
                              style: hargafont,
                            ),
                            Spacer(),
                            RaisedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Pg7_KelasSaya(course?.url))) ;
                             },
                              disabledColor: Colors.red,
                              color: Colors.indigo,

                              child: Text(
                                "Beli",
                                style: TextStyle(color: Colors.white),
                              ),
                              elevation: 10,
                            ),
                            RaisedButton(
                              onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => Pg15_Materi(course?.url)));},
                              child: Text("Buka"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
