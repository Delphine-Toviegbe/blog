import 'dart:async';

import 'package:blog/controllers/api_helper.dart';
import 'package:blog/models/article.dart';
import 'package:blog/models/user.dart';
import 'package:blog/views/start.dart';
import 'package:blog/views/start1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF8D001F),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  dynamic _page = Start();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer timer = Timer(Duration(seconds: 5), () {
      setState(() {
        _page = Start1();
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return _page;
  }
}
