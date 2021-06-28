import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home.dart';
import 'package:note_taking/presentation/first.dart';
import '../buisnesslogic/notesCubit.dart';

class addnote extends StatefulWidget {
  static const id = "addnote";
  final firebase_instance ;
  addnote({this.firebase_instance});
  @override
  _addnoteState createState() => _addnoteState();
}

class _addnoteState extends State<addnote> {
  String title = "title";
  String content = "content";

  @override
  Widget build(BuildContext context) {

    // final firebase_instance = BlocProvider.of<NotesCubit>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF2D2E2E),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                title = value;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15.0),
              child: TextField(
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 5,
                onChanged: (value) {
                  content = value;
                },
                decoration: InputDecoration(
                  focusColor: Color(0xFF2D2E2E),
                  border: OutlineInputBorder(),
                  labelText: 'Text',
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xFF2D2E2E),
        label: Text('Save'),
        onPressed: () async{
         await widget.firebase_instance.addNotes(title, content);

         Navigator.of(context)
             .pushNamedAndRemoveUntil(first.id, (Route<dynamic> route) => false);
        },
      ),
    );
  }
}
