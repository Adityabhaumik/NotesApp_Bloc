import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_taking/presentation/first.dart';
import 'package:note_taking/presentation/trashNotes.dart';
import './presentation/home.dart';
import './presentation/addNote.dart';
import './presentation/SpecificNote.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import './buisnesslogic/notesCubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<NotesCubit>(
          create: (context) => NotesCubit(), child: first()),
      routes: {
        home.id: (context) => home(),
        addnote.id: (context) => addnote(),
        specificNote.id: (context) => specificNote(),
        first.id: (context) => first(),

      },
    );
  }
}
