import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class firebase_operations {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List _listOfNotes = [];
  List _listOfTrashnotes = [];

  void add(String title, String text) async {
    await firestore
        .collection('Notes')
        .add({'title': '${title}', 'description': "$text"});
    await fetchAllNotes();

  }

  Future<List> fetchAllNotes() async {

    await firestore.collection('Notes').get().then((value) {
      value.docs.forEach((element) {
        _listOfNotes.add(element.data());
        print(element.data()['description']);
      });
    });

    return _listOfNotes;
  }

  Future<List> fetchAllTrash() async {
    //Stream documentSnapshot = await firestore.collection('Notes').snapshots();
    await firestore.collection('trash').get().then((value) {
      value.docs.forEach((element) {
        _listOfTrashnotes.add(element.data());
        print(element.data()['description']);
      });
    });

    return _listOfTrashnotes;
  }

  void MovetoTrash(String title, String content) async {
    firestore
        .collection('trash')
        .add({'title': '${title}', 'description': "$content"});
    await firestore
        .collection('Notes')
        .where('title', isEqualTo: title)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        firestore.collection('Notes').doc(element.id).delete();
        //print(element.id);
      });
    });
    _listOfNotes.clear();
    await fetchAllNotes();

  }
}
