import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:markdownnote/home/home.dart';
import 'package:notes_repository/notes_repository.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.notesRepository}) : super(key: key);

  final NotesRepository notesRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: notesRepository,
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        hoverColor: Colors.orange,
      ),
      home: const HomePage(),
    );
  }
}
