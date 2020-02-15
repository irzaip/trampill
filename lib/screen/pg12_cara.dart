import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:trampill/services/keys.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class Pg12Cara extends StatefulWidget {
  @override
  _Pg12CaraState createState() => _Pg12CaraState();
}

class _Pg12CaraState extends State<Pg12Cara> {
  final controller = ScrollController();

  void playYoutubeVideo(youtubeURL) {
    FlutterYoutube.playYoutubeVideoByUrl(
      apiKey: API_KEY,
      videoUrl: youtubeURL,
    );
  }

  final String content= """
  # dengan Konten sendiri.
  
  Buat text file yang meng-urut-kan konten anda seperti playlist.
  
  # menyusun Konten milik orang lain.
  
  buat teks file serupa, ingat untuk menaruh nama asli web/user dari
  pemilik konten asli dan jangan mengakui konten orang lain sebagai milik sendiri.

  """;

  @override
  Widget build(BuildContext context) {
    String isi = 'https://www.youtube.com/watch?v=lodEI2A2iKU';
    Uri ytUrl = Uri.parse(isi);
    String videoID = ytUrl.queryParameters['v'].toString();
    String ytImgUrl = "http://img.youtube.com/vi/" + videoID + "/0.jpg";

    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(title: Text("Cara membuat kelas")),
      body: Container(
        color: Colors.indigo,
        child: Column(
          children: <Widget>[
            Flexible(flex: 2,
              child: Markdown(
                controller: controller,
                selectable: false,
                data: content,
                imageDirectory: 'https://raw.githubusercontent.com',
              ),
            ),
            GestureDetector(
              onTap: (){
                playYoutubeVideo(isi);
              },
              child: Flexible(flex: 1,
              child: Image.network(ytImgUrl),),
            ),
            RaisedButton(onPressed: (){ playYoutubeVideo(isi);},
            child: Text("Buka Video Cara mengisi konten"),)

          ],
        ),
      )
    );
  }
}
