import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:session6_note/blocs/addNote_cubit/add_note_cubit.dart';
import 'package:session6_note/blocs/remove_cubit/remove_cubit.dart';
import 'package:session6_note/components/note_card.dart';
import 'package:session6_note/model/Note_item.dart';
import 'package:session6_note/screens/my_note_details.dart';
import 'package:session6_note/screens/notes_screen.dart';

class AppRoot extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context , child) {
            return MultiBlocProvider(
              providers: [
                //BlocProvider(create: (context)=>RemoveCubit()),
                BlocProvider(create: (context)=>AddNoteCubit())
            ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                home: NotesScreen(),
              ),
            );
          }
      ),
    );
  }
}
