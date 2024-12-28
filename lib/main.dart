import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_q1/bloc/juice_bloc.dart';
import 'package:sample_q1/bloc/juice_event.dart';
import 'package:sample_q1/screens/juiceDetailScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sample_q1/firebase_options.dart';



void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => JuiceBloc(FirebaseFirestore.instance)..add(LoadJuices()),
        child: const JuiceScreen(),
      ),
    );
  }
}