import 'package:flutter/material.dart';
import 'package:markdownnote/home/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const [
          Menu(),
          Expanded(
            child: Placeholder(),
          ),
        ],
      ),
    );
  }
}
