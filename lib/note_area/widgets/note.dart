import 'package:flutter/material.dart';
import 'dart:developer';

class Note extends StatefulWidget {
  const Note({Key? key}) : super(key: key);

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  double _x = 0, _y = 0;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _x,
      top: _y,
      child: GestureDetector(
        child: SizedBox(
          width: 200,
          height: 100,
          child: Container(
            color: Colors.orange,
            child: Center(
              child: SizedBox(
                height: 90,
                width: 200,
                child: Container(
                  alignment: Alignment.topLeft,
                  child: const TextField(
                    maxLines: null,
                  ),
                ),
              ),
            ),
          ),
        ),
        onPanUpdate: (DragUpdateDetails details) {
          setState(() {
            _x += details.delta.dx;
            _y += details.delta.dy;
          });
        },
        onPanEnd: (_) {
          log('($_x, $_y)');
        },
        onTap: () {
          log('Hit outer');
        },
      ),
    );
  }
}
