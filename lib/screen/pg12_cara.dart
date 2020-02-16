import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:trampill/services/keys.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

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
## dengan Konten sendiri.

Kamu bisa menyusun konten yang kamu miliki dengan membuat text file berisi urutan-urutan slide yang kamu ingin tampilkan. 
Ada cara dan susunan yang harus di-ikuti karena apabila tidak di ikuti dengan benar nanti slide tidak akan terdisplay dengan benar.
### Pertama judul.
untuk memulai BAB atau Pembagian bisa di tuliskan dengan menggunakan #(Pagar) satu dengan spasi lalu judul yang di inginkan.
JUDUL ini akan masuk kedalam menu yang ada dalam program trampill.
semua yang BERADA diantara 2 Judul akan menjadi slide dari course tsb.
Setiap baris akan menjadi slide yang terpisah, ada tulisan, ada URL, ada video (Youtube)
untuk penulisan URL harus di letakkan dalam tanda kurung, dan menggunakan spasi dan tanda petik DUA, untuk pemisah keterangan.
lihat video untuk lebih jelasnya.
Link youtube juga harus di letakkan dalam tanda kurung dan SPASI diantara url dan Keterangan. (Lihat Contoh)
Salahnya mengikuti pedoman ini akan menjadikan slide anda kosong.  
Akhiri dengan (# END) di akhir file anda.

## menyusun Konten milik orang lain.
Silahkan gunakan teknik yang sama, tapi di pembuat dilarang MENGAKUI karya orang lain sebagai milik sendiri. Judul dan pembuat konten namanya harus tercantum di CARD depan.
Apabila anda ingin meletakkan nama anda , dapat di letakkan didalam slide presentasi sebagai PENYUSUN MATERI.  
Trampill tidak mengkopi video Youtube, dan semua operasi melihat filem ada pada youtube.
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
      body: SafeArea(
        child: ListView(
          children: <Widget>[ Container(
            color: Colors.indigo,
            child: Column(
              children: <Widget>[
                Container(height: 220,
                  child: GestureDetector(
                    onTap: (){
                      playYoutubeVideo(isi);
                    },
                    child: Image.network(ytImgUrl),
                  ),
                ),
                RaisedButton(onPressed: (){ playYoutubeVideo(isi);},
                child: Text("Buka Video Cara mengisi konten"),),
                RaisedButton(onPressed: (){
                  _launchURL('https://raw.githubusercontent.com/irzaip/TrampillMasterMooc/master/Master2.md');},
                child: Text("Melihat Contoh MasterMooc"),),
                RaisedButton(onPressed: (){
                  _launchURL('https://raw.githubusercontent.com/irzaip/SampleCourse/master/KecerdasanBuatan.md');
                },
                child: Text("Melihat Contoh File Kursus"),),
                Container(
                  child: Markdown(
                    controller: controller,
                    selectable: false,
                    data: content,
                    imageDirectory: 'https://raw.githubusercontent.com',
                    shrinkWrap: true,
                  ),
                ),
              ],
            ),
          ),],
        ),

      )
    );
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}