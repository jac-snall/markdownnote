import 'package:flutter/material.dart';
import 'package:markdownnote/home/widgets/widgets.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: const [
            MenuItem(
              icon: Icons.folder_outlined,
              active: true,
            ),
            MenuItem(icon: Icons.checklist_outlined),
            MenuItem(icon: Icons.search_outlined),
            Spacer(),
            MenuItem(icon: Icons.settings_outlined),
          ],
        ),
      ],
    );
  }
}
