import 'package:flutter/material.dart';
import 'package:session6_note/src/app_root.dart';

import '../services/sharedpreference_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefrenceHelper.init();
  runApp(AppRoot());
}
