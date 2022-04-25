part of 'projects_menu_bloc.dart';

enum ProjectsMenuStatus { initial, loading, success, failure }

class ProjectsMenuState extends Equatable {
  const ProjectsMenuState({
    this.status = ProjectsMenuStatus.initial,
    this.projects = const [],
  });

  final ProjectsMenuStatus status;
  final List<Project> projects;

  ProjectsMenuState copyWith({
    ProjectsMenuStatus Function()? status,
    List<Project> Function()? projects,
  }) {
    return ProjectsMenuState(
      status: status != null ? status() : this.status,
      projects: projects != null ? projects() : this.projects,
    );
  }

  @override
  List<Object> get props => [status, projects];
}
