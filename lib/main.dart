import 'package:flutter/material.dart';
import 'package:practicafinal2/screens/HomePage.dart';
import 'package:practicafinal2/screens/PersonalPage.dart';
import 'package:practicafinal2/screens/WidgetPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SPPMMD',
      routes: {
        '/': (context) => HomePage(),
        '/personal': (context) => PersonalPage(),
        '/widget': (context) => WidgetPage(),
      },
    );
  }
}
