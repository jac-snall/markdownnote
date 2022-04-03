import 'package:flutter/material.dart';
import 'package:markdownnote/home/home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        hoverColor: Colors.orange,
      ),
      home: const HomePage(),
    );
  }
}
