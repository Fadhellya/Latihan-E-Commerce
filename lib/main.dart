import 'package:flutter/material.dart';
import 'package:storefadhellya/detailpage.dart';
import 'package:storefadhellya/insertuser.dart';
import 'package:storefadhellya/items.dart';
import 'package:storefadhellya/listuser.dart';
// import 'package:storefadhellya/listuser.dart';
import 'package:storefadhellya/show_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        scaffoldBackgroundColor: Colors.white,
      ),
      home: const ShowPage(
      ),
    );
  }
}

