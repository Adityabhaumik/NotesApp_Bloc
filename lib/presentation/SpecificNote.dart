import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../buisnesslogic/notesCubit.dart';
import '../presentation/first.dart';

class specificNote extends StatelessWidget {
  static const id = "specificNote";
  String title;
  String content;
  var firebase_instance;

  specificNote({this.title, this.content,this.firebase_instance});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2D2E2E),
        elevation: 0,

      ),
      body: Column(
        children: [
          Text(
            'Title : $title',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            'Content : $content',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async{
           await firebase_instance.moveToTrash(title, content);
           Navigator.of(context)
               .pushNamedAndRemoveUntil(first.id, (Route<dynamic> route) => false);
          }, label: Text('Delete')),
    );
  }
}
