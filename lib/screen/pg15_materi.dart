import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:quiver/strings.dart';


class Pg15_Materi extends StatefulWidget {
  @override
  _Pg15_MateriState createState() => _Pg15_MateriState();
}

class _Pg15_MateriState extends State<Pg15_Materi> {
  Map sampleContent = {
    '1': [
      "Content 1 book",
      "Content 2",
      "(https://youtube.com/irzaip/)",
      "Content 4"
    ],
    '2': ["Content 2-1", "Content 2-2", "Content 2-3"],
    '3': ["Content 3-1", "Content 3-2"]
  };

  buildContent(Map content, int index) {
    List<Widget> content = new List<Widget>();
    String cntdx = sampleContent.keys.toList()[index].toString();

    for (var i = 0; i < sampleContent.length; i++) {
      if (sampleContent[cntdx][i].toString().contains("youtube")) {
        content.add(
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: new Container(
              color: Colors.white,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      "YOUTUBE VIDEO",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        callBottomsheet();
                      },
                      child: Text("Menu"),
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
                child: Text(
                  sampleContent[cntdx][i],
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
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
                onPressed: null,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Materi"),
      ),
      body: Container(
        child: PageView(
          scrollDirection: Axis.horizontal,
          children: buildContent(sampleContent, 0),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Icon(Icons.arrow_left),
                  onPressed: () {},
                ),
                RaisedButton(
                  child: Icon(Icons.assignment),
                  onPressed: () {callBottomsheet();},
                ),
                RaisedButton(
                  child: Icon(Icons.arrow_right),
                  onPressed: () {},
                ),
              ],
            )),
      ),
    );
  }
}



