import 'package:flutter/material.dart';
import 'package:note_taking/buisnesslogic/notesCubit.dart';
import 'package:note_taking/presentation/SpecificNote.dart';
import 'package:note_taking/presentation/addNote.dart';
import '../data/firebase_operations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/notesbody.dart';
import '../presentation/trashNotes.dart';
import '../presentation/tabBar.dart';
class home extends StatefulWidget {
  static const id = "home";

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  bool flag=true;
  @override
  Widget build(BuildContext context) {
    final firebase_instance = BlocProvider.of<NotesCubit>(context);
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Color(0xFF2D2E2E),
        elevation: 0,
        title: Text('Name Notes'),
        actions: [IconButton(icon: Icon(Icons.delete), onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => trashNotes()));
        })],
      ),
      body:notesbody(),
      bottomNavigationBar: MyTabBar(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF00D9C4),
          elevation: 0,
          child: Icon(Icons.add),
          onPressed: () async {
            print('iwaspressed');
            //myoperation.fetchAllContact();
            print(0);

            //firebase_instance.addNotes('firstnote', 'amazingtext');
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => addnote(firebase_instance: firebase_instance,)));
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }


}