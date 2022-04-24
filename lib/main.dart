import 'package:markdownnote/bootstrap.dart';
import 'package:notes_api/notes_api.dart';

void main() async {
  NotesApi notesApi = await NotesApi.create();
  bootstrap(notesApi: notesApi);
}
