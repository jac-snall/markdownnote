import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notes_repository/notes_repository.dart';

part 'projects_menu_event.dart';
part 'projects_menu_state.dart';

class ProjectsMenuBloc extends Bloc<ProjectsMenuEvent, ProjectsMenuState> {
  ProjectsMenuBloc({
    required NotesRepository notesRepository,
  })  : _notesRepository = notesRepository,
        super(const ProjectsMenuState()) {
    on<ProjectsMenuSubscriptionRequested>(_onSubscriptionRequested);
    on<ProjectsMenuProjectAdded>(_onProjectAdded);
  }

  Future<void> _onSubscriptionRequested(
    ProjectsMenuSubscriptionRequested event,
    Emitter<ProjectsMenuState> emit,
  ) async {
    emit(state.copyWith(status: () => ProjectsMenuStatus.loading));

    await emit.forEach<List<Project>>(
      _notesRepository.getProjects(),
      onData: (projects) => state.copyWith(
        status: () => ProjectsMenuStatus.success,
        projects: () => projects,
      ),
      onError: (_, __) => state.copyWith(
        status: () => ProjectsMenuStatus.failure,
      ),
    );
  }

  Future<void> _onProjectAdded(
    ProjectsMenuProjectAdded event,
    Emitter<ProjectsMenuState> emit,
  ) async {
    final newProject = Project()..name = event.projectName;
    await _notesRepository.createProject(newProject);
  }

  final NotesRepository _notesRepository;
}
