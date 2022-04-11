import 'package:flutter/material.dart';
import 'package:markdownnote/note_area/widgets/widgets.dart';

class NoteArea extends StatelessWidget {
  const NoteArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Note(),
      ],
    );
  }
}
