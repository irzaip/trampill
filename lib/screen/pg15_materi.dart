import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:trampill/services/keys.dart';

class Pg15_Materi extends StatefulWidget {
  @override
  _Pg15_MateriState createState() => _Pg15_MateriState();
}

class _Pg15_MateriState extends State<Pg15_Materi> {
  int bottomSelectedIndex = 0;
  int maxPage = 0;

  Map sampleContent = {
    '1': [
      "Content 1 book",
      "Content 2\n\nKonten ini sangat panjang semoga anda terhibur dengan tulisan ini, dan kamipun menjadi senang.",
      "(https://www.youtube.com/watch?v=tc_8yy39RxE)",
      "(https://www.youtube.com/watch?v=bg6vYLs5DKg)",
      "(https://www.youtube.com/watch?v=ndFiHFGW8oQ)",
      "Content 4"
    ],
    '2': ["Content 2-1", "Content 2-2", "Content 2-3"],
    '3': ["Content 3-1", "Content 3-2"]
  };

  void playYoutubeVideo(youtubeURL) {
    FlutterYoutube.playYoutubeVideoByUrl(
      apiKey: API_KEY,
      videoUrl: youtubeURL,
    );
  }

  buildContent(Map content, int index) {
    List<Widget> content = new List<Widget>();
    String cntdx = sampleContent.keys.toList()[index].toString();
    maxPage = sampleContent[cntdx].length;
    for (var i = 0; i < sampleContent[cntdx].length; i++) {
      String isi = sampleContent[cntdx][i].toString();
      if (isi.contains("youtube")) {
        isi = isi.replaceAll("(", "").replaceAll(")", "");
        Uri yturl = Uri.parse(isi);
        String videoID = yturl.queryParameters['v'].toString();
        String ytimgURL = "http://img.youtube.com/vi/" + videoID +"/0.jpg";


        content.add(
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: new Container(
              color: Colors.white,
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.network(ytimgURL),
                    ),
                    Text(
                      "YOUTUBE VIDEO",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20,),
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
                    sampleContent[cntdx][i],
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
                onPressed: (){bottomTapped(3);},
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
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: buildContent(sampleContent, 0),

    );
  }

  @override
  void initState() {
    super.initState();
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
                    prevPage();},
                ),
                RaisedButton(
                  child: Icon(Icons.assignment),
                  onPressed: () {callBottomsheet();},
                ),
                RaisedButton(
                  child: Icon(Icons.arrow_right),
                  onPressed: () {
                    nextPage();},
                ),
              ],
            )),
      ),
    );
  }

  void prevPage() {
    if (bottomSelectedIndex>0){
    bottomSelectedIndex=bottomSelectedIndex-1;
    bottomTapped(bottomSelectedIndex);}
  }

  void nextPage() {
    if (bottomSelectedIndex<maxPage){
    bottomSelectedIndex=bottomSelectedIndex+1;
    bottomTapped(bottomSelectedIndex);}
  }
}



