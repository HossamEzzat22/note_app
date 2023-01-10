import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:session6_note/components/icon_card.dart';
import 'package:session6_note/services/sharedpreference_helper.dart';
import 'package:session6_note/services/sharedpreference_keys.dart';

class MyNoteDetails extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start ,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconCard(icon: Icons.arrow_back_ios_rounded, function: (){
                    Navigator.pop(context);
                  }),
                  IconCard(icon: Icons.edit_rounded, function: (){})
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                '${SharedPrefrenceHelper.getData(key: SharedPrefrenceKeys.titleKey)}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.sp
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                '${SharedPrefrenceHelper.getData(key: SharedPrefrenceKeys.dateKey)}',
                style: TextStyle(
                    color: Colors.grey,
                  fontSize: 20.sp
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                '${SharedPrefrenceHelper.getData(key: SharedPrefrenceKeys.detailsKey)}',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
