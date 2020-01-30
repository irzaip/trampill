import 'package:http/http.dart' as http;


class MoocMaster {
  String url;
  String mooccontent;

  readurl(String url) async {
    //var client = http.Client();

    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    this.mooccontent = response.body;

    RegExp regx = new RegExp(r'(#+)(.*)'); // get the headers
    RegExp regurl = new RegExp(r'\((http.*)\)'); // get urls

    var titles = regx.allMatches(this.mooccontent);
    var urls = regurl.allMatches(this.mooccontent);

    // check apakah mooc mempunyai URL dan judul 3 lapis?
    if (urls.length * 3 == titles.length) {
      print("Mooc OK!.");
    }

    print(urls.length);

    var moocdict = new Map();
    var elm = 0; // start element 0

    for (var i = 0; i < urls.length; i = i + 1) {
      var dic = new Map();
      dic['judul'] = titles.elementAt(elm).group(2);
      dic['oleh'] = titles.elementAt(elm + 1).group(2);
      dic['harga'] = titles.elementAt(elm + 2).group(2);
      dic['url'] = urls.elementAt(i).group(1);
      elm = elm + 3;
      print(titles.length);
      moocdict[i] = dic;
    }

    print(moocdict);

    return response.body;
  }
}


class Course {

  String url;
  Map parsedContent;
  String content;

  readurl(String url) async {

    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');
    this.content = response.body;

    RegExp regx = new RegExp(r'(#+)(.*)', multiLine: true, ); // get the headers
    RegExp regurl = new RegExp(r'\((http.*)\)', multiLine: true); // get urls

    var parsedTitle = content.split(regx);
    print(parsedTitle.length);

    parsedTitle.forEach((f) => print(f));
  }
}