import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'class/bloc_observer.dart';
import 'class/cubit/doctor_cubit.dart';
import 'modules/doctor_ui/Sign_in_doctor.dart';
import 'modules/doctor_ui/home/main_doctor_home.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CubitDoctorHosptial(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(appBarTheme: AppBarTheme(color: HexColor('3D85C6'))),
        home: DoctorSignIn(),
      ),
    );
  }
}
