import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:contextmenu/contextmenu.dart';
import 'package:markdownnote/projects_menu/projects_menu.dart';
import 'package:notes_repository/notes_repository.dart';

class ProjectsMenuItem extends StatelessWidget {
  const ProjectsMenuItem({Key? key, required this.project}) : super(key: key);

  final Project project;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProjectsMenuBloc>();
    return ContextMenuArea(
      child: Text(project.name),
      builder: (context) => [
        ListTile(
          title: const Text('Remove'),
          onTap: () {
            Navigator.of(context).pop();
            bloc.add(ProjectsMenuProjectDeleted(project: project));
          },
        ),
      ],
    );
  }
}
