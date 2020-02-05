class MasterMooc {
  final String title;
  final String oleh;
  final String kategori;
  final String deskripsi;
  final String harga;
  final String rating;
  final String url;

  MasterMooc(this.title, this.oleh, this.kategori, this.deskripsi, this.harga, this.rating, this.url);

}

class CourseContent {
  final String title;
  final List<String> coursecontent;

  CourseContent(this.title, this.coursecontent);

}
