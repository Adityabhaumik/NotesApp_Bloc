import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/firebase_operations.dart';

class NotesCubit extends Cubit<List>{

    final _dataService=firebase_operations();

    NotesCubit():super([]);

    void getNotes()async => emit(await _dataService.fetchAllNotes());
    void getTrash()async => emit(await _dataService.fetchAllTrash());
    void addNotes(String title,String text) {_dataService.add(title,text);}
    void moveToTrash(String title,String text,){_dataService.MovetoTrash(title, text);}


}