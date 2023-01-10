import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../model/Note_item.dart';

part 'remove_state.dart';

class RemoveCubit extends Cubit<RemoveState> {
  RemoveCubit() : super(RemoveInitial());

  static RemoveCubit get(context)=>BlocProvider.of(context);

  List<NoteItem> MyNote = [];



  //functions

  removeNote(int index)
  {
    MyNote.removeAt(index);

    emit(RemoverState());
  }



}
