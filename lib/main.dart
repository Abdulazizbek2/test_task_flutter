import 'package:flutter/material.dart';
import 'package:test_task_flutter/screen/home/home.dart';
import 'package:test_task_flutter/service/theme.dart';

Future<void> main() async {
  runApp(const ForestVPNTestApp());
}

class ForestVPNTestApp extends StatelessWidget {
  const ForestVPNTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ForestVPN test',
      theme: themeData,
      home: const HomeScreen(),
    );
  }
}
