import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';
import 'models/models.dart';

class NotesApi {
  //Factory function
  static Future<NotesApi> create() async {
    final isar = await Isar.open(
      schemas: [ProjectSchema],
      directory: join((await getApplicationDocumentsDirectory()).path, '.markdownnote'),
    );
    final notesApi = NotesApi._create(isar: isar);
    return notesApi;
  }

  final Isar _isar;
  const NotesApi._create({required Isar isar}) : _isar = isar;

  Future<void> createProject(Project project) {
    return _isar.writeTxn((isar) async {
      _isar.projects.put(project);
    });
  }

  Future<void> deleteProject(Project project) {
    return _isar.writeTxn((isar) async {
      if (project.id != null) {
        _isar.projects.delete(project.id as int);
      }
    });
  }

  Stream<List<Project>> getProjects() {
    return _isar.projects.where().build().watch(initialReturn: true);
  }
}
