import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:trampill/services/keys.dart';
import 'package:trampill/services/Course.dart';
import 'package:http/http.dart' as http;


class Pg15Materi extends StatefulWidget {
  final String courseUrl;
  Pg15Materi(this.courseUrl);

  @override
  _Pg15MateriState createState() => _Pg15MateriState(this.courseUrl);
}

class _Pg15MateriState extends State<Pg15Materi> {
  //bool _isInitialized = false;
  String courseUrl = "";
  Future<int> loadDone;

  _Pg15MateriState(String ttl);
  int tOCIndex = 0;
  int bottomSelectedIndex = 0;
  int maxPage = 0;
  String defaultCourseUrl =
      "https://raw.githubusercontent.com/irzaip/SampleCourse/master/KecerdasanBuatan.md";
  List<CourseContent> contentToDisplay = new List<CourseContent>();

  @override
  void initState() {
    courseUrl = widget.courseUrl;
    //print(courseUrl);

    if (courseUrl == "") {
      courseUrl = defaultCourseUrl;
    }
    loadDone = readUrl(courseUrl);
    super.initState();
  }

  void playYoutubeVideo(youtubeURL) {
    FlutterYoutube.playYoutubeVideoByUrl(
      apiKey: API_KEY,
      videoUrl: youtubeURL,
    );
  }

  Future<int> readUrl(String url) async {
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    var content = response.body;

    if (response.statusCode == 200) {

        LineSplitter ls = new LineSplitter();
        List<String> coursecontent = ls.convert(content);
        List<int> headindx = [];

        //coursecontent.removeWhere((element) => element.toString() == "");

        coursecontent.asMap().forEach((index, element) {
          if (element.startsWith("# ")) {
            //print(index);
            headindx.add(index);
          }
        });

        for (int i = 0; i < headindx.length - 1; i++) {
          List<String> cleaned = coursecontent.getRange(headindx[i],headindx[i+1]).toList();

          contentToDisplay.add(new CourseContent(coursecontent[headindx[i]],
              cleaned));
        }

        return 1;
    } else {
    List<String> cont = ["ERROR", "ERROR"];
    contentToDisplay.add(new CourseContent("ERROR LOADING", cont));
    return 1; }
  }

  buildContent(List<CourseContent> coursecontent, int index) {
    List<Widget> content = new List<Widget>();

    var currentIndexContent = index;
    maxPage = contentToDisplay[currentIndexContent].coursecontent.length;

    for (var i = 0; i < maxPage; i++) {
      String isi =
          contentToDisplay[currentIndexContent].coursecontent[i].toString();
      if (isi.contains("youtube")) {
        //manipulasi url dalam kurung
        isi = isi.replaceAll("(", "").replaceAll(")", "");
        isi = isi.replaceFirst(" ", "#");
        var isiLengkap = isi.split("#");
        var ket = isiLengkap[1].replaceAll("\"", "");
        isi = isiLengkap[0];

        Uri ytUrl = Uri.parse(isi);
        String videoID = ytUrl.queryParameters['v'].toString();
        String ytImgUrl = "http://img.youtube.com/vi/" + videoID + "/0.jpg";

        content.add(
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: new Container(
              color: Colors.white,
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.network(ytImgUrl),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        ket,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      onPressed: () {
                        playYoutubeVideo(isi);
                      },
                      child: Text("Buka"),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      } else {
        content.add(
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: new Container(
              color: Colors.white,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    contentToDisplay[currentIndexContent].coursecontent[i],
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }
    }
    content.removeLast();
    return content;
  }

  callBottomsheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: tableOfContent(),
            ),
          ),
        );
      },
    );
  }

  List<Widget> tableOfContent() {
    List<Widget> _tOCcontent = new List<Widget>();

    for (int i = 0; i < contentToDisplay.length; i++) {
      _tOCcontent.add(RaisedButton(
        onPressed: () {
          setState(() {
            tOCIndex = i;
            bottomSelectedIndex = 0;
            buildContent(contentToDisplay, tOCIndex);
            pageController.jumpToPage(0);
            Navigator.of(context).pop();
          });
        },
        color: Colors.blue,
        child: Text(contentToDisplay[i].title.toString()),
      ));
    }
    return _tOCcontent;
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return FutureBuilder(
      future: loadDone,
      builder: (context, AsyncSnapshot<int> snapshot) {
        if (snapshot.hasData) {
          return PageView(
            controller: pageController,
            onPageChanged: (index) {
              pageChanged(index);
            },
            children: buildContent(contentToDisplay, tOCIndex),
          );
        } else if (snapshot.hasError) {
          return Container(child: Text("${snapshot.error}"));
        }
        return Container(child: Center(child: CircularProgressIndicator()));
      },
    );
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Materi"),
      ),
      body: Container(
        child: buildPageView(),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                child: Icon(Icons.arrow_left),
                onPressed: () {
                  prevPage();
                  print("Pressed Left");
                  print(bottomSelectedIndex);
                },
              ),
              RaisedButton(
                child: Icon(Icons.assignment),
                onPressed: () {
                  callBottomsheet();
                },
              ),
              RaisedButton(
                child: Icon(Icons.arrow_right),
                onPressed: () {
                  nextPage();
                  print("Pressed Right");
                  print(maxPage);
                  print(bottomSelectedIndex);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void prevPage() {
    if (bottomSelectedIndex > 0) {
      bottomSelectedIndex = bottomSelectedIndex - 1;
      bottomTapped(bottomSelectedIndex);
    }
  }

  void nextPage() {
    if (bottomSelectedIndex < maxPage) {
      bottomSelectedIndex = bottomSelectedIndex + 1;
      bottomTapped(bottomSelectedIndex);
    }
  }
}
