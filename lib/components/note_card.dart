import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:session6_note/model/Note_item.dart';
import 'package:session6_note/screens/my_note_details.dart';
import 'package:session6_note/services/sharedpreference_helper.dart';
import 'package:session6_note/services/sharedpreference_keys.dart';
import 'package:session6_note/utils/app_navigator.dart';

import '../src/app_colors.dart';

class NoteCard extends StatelessWidget {
  final NoteItem noteItem;


  NoteCard({required this.noteItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        SharedPrefrenceHelper.saveData(key: SharedPrefrenceKeys.titleKey, value: noteItem.title);
        SharedPrefrenceHelper.saveData(key: SharedPrefrenceKeys.dateKey, value: noteItem.date);
        AppNavigator(context, false, MyNoteDetails());
      },
      child: Column(
        children: [
          Container(
            height: 160.h,
            width: double.infinity,
            decoration: BoxDecoration(
                color:noteItem.containerColor,
                borderRadius: BorderRadius.circular(15)
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 200.w,
                    child: Text(
                      noteItem.title,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.normal

                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      noteItem.date,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
