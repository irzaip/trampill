import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trampill/services/Course.dart';

class MoocMaster {
  String url;
  String mooccontent;

  readurl(String url) async {
    //var client = http.Client();
    http.Response response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    this.mooccontent = response.body;

    if (response.statusCode == 200) {
      RegExp regx = new RegExp(r'(#+)(.*)'); // get the headers
      RegExp regurl = new RegExp(r'\((http.*)\)'); // get urls
      
      var titles = regx.allMatches(this.mooccontent);
      var urls = regurl.allMatches(this.mooccontent);
      
      // check apakah mooc mempunyai URL dan judul 3 lapis?
      if (urls.length * 6 == titles.length && urls.length != 0) {
        print("Mooc OK!.");
      
        print(urls.length);
      
        List<MasterMooc> moocdict = [];
        var elm = 0; // start element 0
      
        for (var i = 0; i < urls.length; i = i + 1) {
      
          String judul = titles.elementAt(elm).group(2).toString();
          String oleh = titles.elementAt(elm + 1).group(2).toString();
          String kategori = titles.elementAt(elm + 2).group(2).toString();
          String deskripsi = titles.elementAt(elm + 3).group(2).toString();
          String harga = titles.elementAt(elm + 4).group(2).toString();
          String rating = titles.elementAt(elm + 5).group(2).toString();
          String url = urls.elementAt(i).group(1).toString();
      
          moocdict.add(new MasterMooc(judul, oleh, kategori, deskripsi, harga, rating, url));
        }
        return moocdict;
      } else
        {
          print("MOOC MASTER COURSE READ - ERROR!");
        }
    }
  }
}

class Course {
  String url;
  String content;

  readurl(String url) async {
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');
    this.content = response.body;

    RegExp regx = new RegExp(r'(######+)(.*)', multiLine: true); // get the headers


    var matched = regx.allMatches(content);

    List<CourseContent> mycourse = [];

    for (int i = 0; i < matched.length; i++) {
      try {
        var cutt = this.content.indexOf(matched.elementAt(i).group(0));
        var cutt2 = this.content.indexOf(matched.elementAt(i + 1).group(0));
        //print(this.content.indexOf(cutt));

        var cutresult = content.substring(cutt, cutt2);
        LineSplitter ls = new LineSplitter();
        List<String> coursecontent = ls.convert(cutresult);

        // print(coursecontent);
        mycourse.add(new CourseContent(
            matched.elementAt(i).group(0).toString(), coursecontent));
        print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
      } catch (e) {
        print("error parsing - content, maybe it's the end");
      }
    }
    //mycourse[2].coursecontent.forEach((element) {
      //print(element);
    //}
    //);
    return mycourse;
  }
}
