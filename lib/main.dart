import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trampill/screen/pg11_hubungikami.dart';
import 'package:trampill/screen/pg12_cara.dart';
import 'package:trampill/screen/pg13_privasi.dart';
import 'package:trampill/screen/pg14_syaratketentuan.dart';
import 'package:trampill/screen/pg22_setting.dart';
import 'package:trampill/screen/pg23_tentangapp.dart';
import 'package:trampill/screen/pg24_feedback.dart';
import 'package:trampill/screen/pg7_kelassaya.dart';
import 'package:trampill/screen/pg9ADetail.dart';
import 'package:trampill/services/Course.dart';
import 'screen/pg3_lainnya.dart';
import 'package:trampill/screen/pg3_lainnya.dart';
import 'screen/pg21_main_course.dart';
import 'screen/pg8_pembelian.dart';
import 'screen/pg10_tentang.dart';
import 'screen/pg15_materi.dart';
import 'screen/pg11_hubungikami.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tramp",
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.grey,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyStatefulWidget(),
        '/pg3_lainnya': (context) => Pg3Lainnya(),
        '/pg8_pembelian': (context) => Pg8Pembelian(),
        '/pg10_tentang': (context) => Pg10Tentang(),
        '/pg11_hubungikami': (context) => Pg11HubungiKami(),
        '/pg12_cara': (context) => Pg12Cara(),
        '/pg13_privasi': (context) => Pg13Privasi(),
        '/pg14_syaratketentuan': (context) => Pg14SyaratKetentuan(),
        '/pg21_main_course': (context) => InputPage(),
        '/pg22_setting': (context) => Pg22Setting(),
        '/pg23_tentangapp': (context) => Pg23TentangApp(),
        '/pg24_feedback': (context) => Pg24Feedback(),
      }
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  var defUrlMasterMooc =
      "";
  List<MasterMooc> courseList = new List<MasterMooc>();
  Future<int> loadDone;


  List<String> imgList = [
    'https://images.unsplash.com/photo-1511447333015-45b65e60f6d5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80',
    'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg',
    'https://cdn.wallpaperhub.app/cloudcache/1/b/5/8/e/f/1b58ef6e3d36a42e01992accf5c52d6eea244353.jpg',
    'https://c4.wallpaperflare.com/wallpaper/246/739/689/digital-digital-art-artwork-illustration-abstract-hd-wallpaper-thumb.jpg',
  ];

  @override
  void initState() {
    readUrl();
    super.initState();

  }

  Future<void> readUrl() async {
    String mm = "https://raw.githubusercontent.com/irzaip/TrampillMasterMooc/master/Master.md";
    SharedPreferences pref = await SharedPreferences.getInstance();
    defUrlMasterMooc = pref.getString("MasterMooc") ?? mm;

    if (defUrlMasterMooc == "") {
      defUrlMasterMooc = mm;
    }

    courseList.clear();
    //var client = http.Client();
    http.Response response = await http.get(defUrlMasterMooc);
    print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');
    var mooccontent = response.body;

    if (response.statusCode == 200) {
      RegExp regx = new RegExp(r'(#+)(.*)'); // get the headers
      RegExp regurl = new RegExp(r'\((http.*)\)'); // get urls

      var titles = regx.allMatches(mooccontent);
      var urls = regurl.allMatches(mooccontent);

      // check apakah mooc mempunyai URL dan judul 3 lapis?
      if (urls.length * 6 == titles.length && urls.length != 0) {
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
          elm = elm + 6;
          courseList.add(new MasterMooc(
              judul,
              oleh,
              kategori,
              deskripsi,
              harga,
              rating,
              url));
        }
      }
    } else {
      courseList.add(new MasterMooc(
          "ERROR LOADING",
          "ERROR LOADING",
          "ERROR LOADING",
          "ERROR LOADING",
          "ERROR LOADING",
          "ERROR LOADING",
          "ERROR LOADING"));
      print("MOOC MASTER COURSE READ - ERROR!");
    }
    setState(() { });
  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if (_selectedIndex == 1) {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>
            Pg7KelasSaya("Masih dalam Konstruksi"))) ;
      }
      if (_selectedIndex == 2) {
        Navigator.pushNamed(context, '/pg8_pembelian');
      }
      if (_selectedIndex == 3) {
        Navigator.pushNamed(context, '/pg3_lainnya');
      }
    });
  }

  List<Widget> courseCard() {
    TextStyle bigfont = TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
    TextStyle mediumfont = TextStyle(fontSize: 14, color: Colors.black);
    //TextStyle deskripsifont = TextStyle(fontSize: 16, color: Colors.black);
    TextStyle kategorifont = TextStyle(fontSize: 13, color: Colors.blueGrey);
    TextStyle hargafont = TextStyle(
        fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.w700);

    List<Widget> course = [];

    course.add(new Container(
        height: 250,
        color: Colors.grey,
        child: PhotoViewGallery.builder(
          scrollPhysics: const BouncingScrollPhysics(),
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: NetworkImage(imgList[index]),
              //initialScale: PhotoViewComputedScale.contained * 0.8,
              //heroAttributes: HeroAttributes(tag: galleryItems[index].id),
              heroAttributes: PhotoViewHeroAttributes(tag: imgList[index]),
            );
          },
          itemCount: imgList.length,
          reverse: false,
          loadingBuilder: (context, event) => Center(
            child: Container(
              padding: EdgeInsets.all(10),
              width: 20.0,
              height: 20.0,
              child: CircularProgressIndicator(
                value: event == null
                    ? 0
                    : event.cumulativeBytesLoaded / event.expectedTotalBytes,
              ),
            ),
          ),
          backgroundDecoration: BoxDecoration(color: Colors.grey, ),
          //pageController: widget.pageController,
          //onPageChanged: onPageChanged,
        )
    ));

    for (int i = 0; i < courseList.length; i++){
      course.add(new Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  Pg9ADetail(courseList[i]))) ;
            },
            child: Card(
              elevation: 10,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(20))
              ),
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
                                    courseList[i].title,
                                    style: bigfont,
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                courseList[i].oleh,
                                style: mediumfont,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                courseList[i].kategori,
                                style: kategorifont,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                courseList[i].harga,
                                style: hargafont,
                              ),
                              Spacer(),
                              //BuyButton(course: course),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) =>
                                          Pg15Materi(courseList[i].url)
                                  ));},
                                child: Text("BUKA"),
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
      )
      );
    }
    return course;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trampill"),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  readUrl();
                  setState(() { });
                },
                child: Icon(
                  Icons.refresh,
                  size: 26.0,
                ),
              )
          ),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )
          ),
        ],
      ),
      body: ListView(children: courseCard(),),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Beranda"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              title: Text("Kelas saya"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.payment),
              title: Text("Pembelian")
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              title: Text("Lainnya"),
            ),
          ],
      currentIndex:  _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
      ),
    );
  }
}


