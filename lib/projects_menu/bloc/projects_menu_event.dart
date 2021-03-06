part of 'projects_menu_bloc.dart';

abstract class ProjectsMenuEvent extends Equatable {
  const ProjectsMenuEvent();

  @override
  List<Object> get props => [];
}

class ProjectsMenuSubscriptionRequested extends ProjectsMenuEvent {
  const ProjectsMenuSubscriptionRequested();
}

class ProjectsMenuProjectAdded extends ProjectsMenuEvent {
  const ProjectsMenuProjectAdded({required this.projectName});

  final String projectName;

  @override
  List<Object> get props => [projectName];
}

class ProjectsMenuProjectDeleted extends ProjectsMenuEvent {
  const ProjectsMenuProjectDeleted({required this.project});
  final Project project;

  @override
  List<Object> get props => [project];
}
