import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rest_api/services/notes_service.dart';
import 'package:rest_api/views/note_list.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(() => NotesService());
}

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 21, 209, 21)),
        //useMaterial3: true,
      ),
      home: const NoteList(),
    );
  }
}
