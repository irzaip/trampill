import 'package:flutter/material.dart';
import 'package:trampill/pg3_Lainnya.dart';
import 'pg21_main_course.dart';
import 'pg10_tentang.dart';
import 'pg3_Lainnya.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0A0A),
        scaffoldBackgroundColor: Color(0xFF0A0A0A),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Pg3_Lainnya(),
        '/pg3_lainnya': (context) => Pg3_Lainnya(),
        '/pg10_tentang': (context) => Pg10_Tentang(),
        '/pg21_main_course': (context) => InputPage()
      }
    );
  }
}
