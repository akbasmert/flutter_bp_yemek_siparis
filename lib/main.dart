import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bp_yemek_siparis/ui/cubit/anasayfa_cubit.dart';
import 'package:flutter_bp_yemek_siparis/ui/cubit/yemek_detay_cubit.dart';
import 'package:flutter_bp_yemek_siparis/ui/cubit/yemek_sepet_cubit.dart';
import 'package:flutter_bp_yemek_siparis/ui/screen/ansayfa2.dart';
import 'package:flutter_bp_yemek_siparis/ui/screen/yemek_sepet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>AnasayfaCubit()),
          BlocProvider(create: (context)=>YemekDetayCubit()),
          BlocProvider(create: (context)=>YemekSepetCubit()),



        ],
        child: MaterialApp(

          title: "Yemek Sipariş",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: "Schyler"
          ),
          home: Anasayfa2(),
        )
    );
  }
}
