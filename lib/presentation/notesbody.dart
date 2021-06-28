import 'package:flutter/material.dart';
import 'package:note_taking/buisnesslogic/notesCubit.dart';
import 'package:note_taking/presentation/SpecificNote.dart';
import 'package:note_taking/presentation/addNote.dart';
import '../data/firebase_operations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class notesbody extends StatelessWidget {
  const notesbody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebase_instance = BlocProvider.of<NotesCubit>(context);
    return BlocBuilder<NotesCubit, List>(
      buildWhen: (previous,current){
               return true;
      },
      builder: (context, myList) {
        if (myList.isEmpty) {
          return Center(child: Container(),);
        }
        return ListView.builder(

          itemCount: myList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Card(
                child: ListTile(
                  title: Text('${myList[index]['title']}'),
                  subtitle: Text('${myList[index]['description']}'),
                ),
              ),
              onTap: () {
                print(myList);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => specificNote(title: myList[index]['title'],content:myList[index]['description'],firebase_instance:firebase_instance )));
               },
            );
          },
        );
      },
    );
  }
}
