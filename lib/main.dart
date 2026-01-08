import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starlife_task/app.dart';
import 'package:starlife_task/core/di/injection.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();

  WidgetsFlutterBinding.ensureInitialized();
  // for dependency injection
  await init();
  runApp(const MyApp());
}
