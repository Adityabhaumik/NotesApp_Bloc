import 'package:flutter/material.dart';
import 'home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../buisnesslogic/notesCubit.dart';
class first extends StatelessWidget {
  static const id = "first";

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotesCubit>(
      create: (context) => NotesCubit()..getNotes(), child: home(),);
  }
}
