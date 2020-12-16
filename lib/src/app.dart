import 'package:flutter/material.dart';
import 'package:templateproject/src/pages/decision_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Sample',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: DecisionPage(),
    );
  }
}
