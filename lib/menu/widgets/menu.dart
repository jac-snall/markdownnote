import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:markdownnote/menu/cubit/menu_cubit.dart';
import 'package:markdownnote/menu/widgets/widgets.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selctedTab = context.select((MenuCubit cubit) => cubit.state.tab);
    return Row(
      children: [
        Column(
          children: [
            MenuItem(
              icon: Icons.folder_outlined,
              value: MenuTab.projects,
              groupValue: selctedTab,
            ),
            MenuItem(
              icon: Icons.checklist_outlined,
              value: MenuTab.todos,
              groupValue: selctedTab,
            ),
            MenuItem(
              icon: Icons.search_outlined,
              value: MenuTab.search,
              groupValue: selctedTab,
            ),
            const Spacer(),
            MenuItem(
              icon: Icons.settings_outlined,
              value: MenuTab.settings,
              groupValue: selctedTab,
            ),
          ],
        ),
        const VerticalDivider(
          color: Colors.black,
          width: 2,
          thickness: 2,
        ),
        Column(
          children: const [
            Text('Menu'),
            Placeholder(
              fallbackWidth: 200,
            ),
          ],
        )
      ],
    );
  }
}
