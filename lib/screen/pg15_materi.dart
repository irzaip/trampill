import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:trampill/services/keys.dart';
import 'package:trampill/services/Course.dart';
import 'package:http/http.dart' as http;

class Pg15_Materi extends StatefulWidget {
  final String courseUrl;
  Pg15_Materi(this.courseUrl);

  @override
  _Pg15_MateriState createState() => _Pg15_MateriState(this.courseUrl);
}

class _Pg15_MateriState extends State<Pg15_Materi> {
  //bool _isInitialized = false;
  String courseUrl = "";
  Future<int> loadDone;

  _Pg15_MateriState(String ttl);

  int bottomSelectedIndex = 0;
  int maxPage = 0;
  String defaultCourseUrl =
      "https://raw.githubusercontent.com/irzaip/SampleCourse/master/KecerdasanBuatan.md";
  List<CourseContent> sampleContent = new List<CourseContent>();

  @override
  void initState() {
    courseUrl = widget.courseUrl;
    print(courseUrl);

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

    RegExp regx =
        new RegExp(r'(######+)(.*)', multiLine: true); // get the headers
    RegExp regurl = new RegExp(r'\((http.*)\)', multiLine: true); // get urls

    var matched = regx.allMatches(content);
    print(matched.length);

    for (int i = 0; i < matched.length; i++) {
      try {
        var cutBegin = content.indexOf(matched.elementAt(i).group(0));
        var cutEnd = content.indexOf(matched.elementAt(i + 1).group(0));
        var cutResult = content.substring(cutBegin, cutEnd);

        LineSplitter ls = new LineSplitter();
        List<String> coursecontent = ls.convert(cutResult);

        sampleContent.add(new CourseContent(
            matched.elementAt(i).group(0).toString(), coursecontent));
      } catch (e) {
        print("error parsing - content, maybe it's the end");
      }
    }
    setState(() {});
    return 1;
  }

  buildContent(List<CourseContent> coursecontent, int index) {
    List<Widget> content = new List<Widget>();
    List<String> tablecontent = new List<String>();

    sampleContent.forEach((element) {
      tablecontent.add(element.title);
      print(element.title);
    });

    var currentIndexContent = 0;
    maxPage = sampleContent[currentIndexContent].coursecontent.length;

    for (var i = 0; i < maxPage; i++) {
      String isi =
          sampleContent[currentIndexContent].coursecontent[i].toString();
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
                      padding: const EdgeInsets.all(15.0),
                      child: Image.network(ytImgUrl),
                    ),
                    Text(
                      ket,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
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
                    sampleContent[currentIndexContent].coursecontent[i],
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

    return content;
  }

  callBottomsheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: null,
                child: Text(
                  "Week 1",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  bottomTapped(3);
                },
                child: Text(
                  "Week 2",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return FutureBuilder(
      future: loadDone,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return PageView(
            controller: pageController,
            onPageChanged: (index) {
              pageChanged(index);
            },
            children: buildContent(sampleContent, 0),
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
        )),
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
