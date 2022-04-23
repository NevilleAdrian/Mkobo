import 'package:flutter/material.dart';
import 'package:mkobo/screens/applayout/applayout.dart';
import 'package:mkobo/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mkobo',
      theme: myThemeData(context),
      debugShowCheckedModeBanner: false,
      home:  AppLayout(),
    );
  }
}
