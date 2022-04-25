import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:markdownnote/projects_menu/projects_menu.dart';
import 'package:notes_repository/notes_repository.dart';

class ProjectsMenu extends StatelessWidget {
  const ProjectsMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProjectsMenuBloc(
        notesRepository: context.read<NotesRepository>(),
      )..add(const ProjectsMenuSubscriptionRequested()),
      child: const ProjectsMenuView(),
    );
  }
}

class ProjectsMenuView extends StatelessWidget {
  const ProjectsMenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ProjectsMenuBloc, ProjectsMenuState>(builder: (context, state) {
          if (state.projects.isEmpty) {
            if (state.status == ProjectsMenuStatus.loading) {
              return const Center(child: Text('Loading'));
            } else if (state.status != ProjectsMenuStatus.success) {
              return const SizedBox();
            } else {
              return const Center(child: Text('No projects'));
            }
          }

          return Column(
            children: [
              for (final project in state.projects) Text(project.name),
            ],
          );
        }),
        TextButton(
          child: const Text('hello'),
          onPressed: () {
            context.read<ProjectsMenuBloc>().add(ProjectsMenuProjectAdded(projectName: 'Test1'));
          },
        )
      ],
    );
  }
}
