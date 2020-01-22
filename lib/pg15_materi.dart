import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';


class Pg15_Materi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Materi"),),
      body: AnimatedSwitcher(
        duration: const Duration(seconds: 2),
        child: Text("Hello Friend"),
      ),

      bottomNavigationBar: BottomAppBar(
        child: Container(child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
                child: Icon(Icons.arrow_left),
              onPressed: () {
                  },
            ),
            RaisedButton(
              child: Icon(Icons.assignment),
              onPressed: () {},
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

class _myWid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("AWA"),
    );
  }
}

