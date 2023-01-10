import 'package:flutter/material.dart';
import 'package:session6_note/utils/app_navigator.dart';
import '../screens/notes_screen.dart';


class DismissibleDelete extends StatelessWidget {
  final Widget child;
  final VoidCallback onDelete;
  //final VoidCallback searchDelete;
  final Key key;

  const DismissibleDelete({required this.key,
    required this.child,
    required this.onDelete,
    //required this.searchDelete}
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: key,
      child: child,
      background: Icon(
        Icons.delete,
        color: Colors.red,
      ),
      onDismissed:(_){
       onDelete();
      },
      // confirmDismiss: (direction) {
      //   return showDialog(
      //     context: context,
      //     builder: (context) {
      //       return Directionality(
      //         textDirection: TextDirection.rtl,
      //         child: Dialog(
      //           child: Container(
      //             decoration: BoxDecoration(
      //               color: Colors.white,
      //               borderRadius: BorderRadius.circular(20),
      //
      //             ),
      //             child: Column(mainAxisSize: MainAxisSize.min, children: [
      //               Text("Confirm Delete"),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   TextButton(
      //                       onPressed: onDelete,
      //                       child: Text(
      //                         "Yes",
      //                         style: TextStyle(color: Colors.red),
      //                       )),
      //                   TextButton(
      //                     onPressed: () {
      //                       AppNavigator(context, true, NotesScreen());
      //                     },
      //                     child: Text("No"),
      //                   ),
      //                 ],
      //               )
      //             ]),
      //           ),
      //         ),
      //       );
      //     },
      //   );
      // },

    );
  }
}
