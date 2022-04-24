import 'package:notes_api/notes_api.dart';

class NotesRepository {
  const NotesRepository({required NotesApi notesApi}) : _notesApi = notesApi;

  final NotesApi _notesApi;

  Stream<List<Project>> getProjects() => _notesApi.getProjects();

  Future<void> createProject(Project project) => _notesApi.createProject(project);
}
