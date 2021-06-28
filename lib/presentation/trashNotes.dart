import 'package:flutter/material.dart';
import 'package:note_taking/buisnesslogic/notesCubit.dart';
import 'package:note_taking/presentation/SpecificNote.dart';
import 'package:note_taking/presentation/addNote.dart';
import 'package:note_taking/presentation/home.dart';
import '../data/firebase_operations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/notesbody.dart';

class trashNotes extends StatefulWidget {
  static const id = "trashNotes";

  @override
  _trashNotesState createState() => _trashNotesState();
}

class _trashNotesState extends State<trashNotes> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFF2D2E2E),
        elevation: 0,),
      body: BlocProvider<NotesCubit>(
          create: (context) => NotesCubit()..getTrash(), child: notesbody()),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Color(0xFF2D2E2E),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
                onPressed: () {
                  print('gotpressed');
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => home()));
                },
                child: Text(
                  'Notes',
                  style: TextStyle(color: Colors.white),
                )),
            TextButton(
                onPressed: () {
                  print('gotpressed2');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => trashNotes()));
                },
                child: Text(
                  'Trash',
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF00D9C4),
          elevation: 0,
          child: Icon(Icons.add),
          onPressed: () async {
            print('iwaspressed');
            //myoperation.fetchAllContact();
            print(0);

            //myoperation.add('firstnote', 'amazingtext');
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => addnote()));
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
