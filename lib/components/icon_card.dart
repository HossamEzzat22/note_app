import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconCard extends StatelessWidget {

  final icon ;
  final function ;


  IconCard({required this.icon,required this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 40.w,
      decoration: BoxDecoration(
          color: Colors.grey[700],
          borderRadius: BorderRadius.circular(10)
      ),
      child: IconButton(
          onPressed: function,
          icon: Icon(
            icon,
            size: 20,
            color: Colors.white,
          )),
    );
  }
}
