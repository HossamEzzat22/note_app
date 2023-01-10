import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:session6_note/blocs/addNote_cubit/add_note_cubit.dart';
import 'package:session6_note/blocs/remove_cubit/remove_cubit.dart';
import 'package:session6_note/components/note_card.dart';
import 'package:session6_note/model/Note_item.dart';
import 'package:session6_note/screens/my_note_details.dart';
import 'package:session6_note/services/sharedpreference_helper.dart';
import 'package:session6_note/services/sharedpreference_keys.dart';
import 'package:session6_note/src/app_colors.dart';
import 'package:session6_note/utils/app_navigator.dart';

import '../services/dismissible_delete.dart';

class NotesScreen extends StatefulWidget {
  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {},
      builder: (context, state) {
        //var cubit = RemoveCubit.get(context);
        var cubit2 = AddNoteCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Notes',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.sp),
                      ),
                      Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                            color: Colors.grey[700],
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.search,
                              color: Colors.white,
                            )),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  cubit2.MyNote.isEmpty
                      ? Expanded(
                          child: Center(
                            child: Text(
                              'ADD NOTE +...',
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ),
                        )
                      : Expanded(
                          child: GridView.builder(
                              shrinkWrap: true,
                              itemCount: cubit2.MyNote.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                childAspectRatio: 1.8,
                              ),
                              itemBuilder: (context, index) =>
                                  DismissibleDelete(
                                      key: ObjectKey(cubit2.MyNote[index]),
                                      onDelete: () {
                                        //cubit.removeNote(index);
                                        setState(() {
                                          cubit2.MyNote.removeAt(index);
                                        });

                                      },
                                      child: NoteCard(
                                          noteItem: cubit2.MyNote[index]))),
                        ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(25.0))),
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: Container(
                        height: 400.h,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                autofocus: true,
                                focusNode: cubit2.titleNode,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(cubit2.detailsNode);
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'title'),
                                style: TextStyle(fontSize: 25.sp),
                                controller: cubit2.titleController,
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'details'),
                                focusNode: cubit2.detailsNode,
                                style: TextStyle(fontSize: 18.sp),
                                maxLines: 5,
                                minLines: 2,
                                controller: cubit2.detailsController,
                                onFieldSubmitted: (value) {
                                  cubit2.addNote();
                                  cubit2.clearData();
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: Icon(Icons.create),
          ),
        );
      },
    );
  }
}
