import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';
import 'models/models.dart';

class NotesApi {
  //Factory function
  static Future<NotesApi> create() async {
    final isar = await Isar.open(
      schemas: [ProjectSchema],
      directory: (await getApplicationDocumentsDirectory()).path,
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

  Stream<List<Project>> getProjects() {
    return _isar.projects.where().build().watch(initialReturn: true);
  }
}
