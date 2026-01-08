import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starlife_task/core/di/injection.dart';
import 'package:starlife_task/feature/login/presentation/view/screens/login_screen.dart';
import 'package:starlife_task/feature/login/presentation/view_model/cubit/login_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'First Method',

            // You can use the library anywhere in the app even in theme
            home: child,
          );
        },
        child: const LoginScreen(),
      ),
    );
  }
}
