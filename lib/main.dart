import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:papa_entulho/domain/app/my_app.dart';
import 'package:papa_entulho/firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
