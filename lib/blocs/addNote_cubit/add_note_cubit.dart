import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../model/Note_item.dart';
import '../../services/sharedpreference_helper.dart';
import '../../services/sharedpreference_keys.dart';
import '../../src/app_colors.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  static AddNoteCubit get(context)=>BlocProvider.of(context);


  List<NoteItem> MyNote = [];


  //variable

  TextEditingController titleController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  FocusNode  titleNode =FocusNode();
  FocusNode  detailsNode =FocusNode();

  //function

  addNote()
  {

    MyNote.add(NoteItem(title:titleController.text, date: 'May 21, 2000', containerColor: AppColors.babyBlue));
    SharedPrefrenceHelper.saveData(key:SharedPrefrenceKeys.detailsKey, value: detailsController.text);

    emit(AddNoteAddState());
  }
  clearData()
  {
    titleController.clear();
    detailsController.clear();
    emit(clearDataState());
  }
}
