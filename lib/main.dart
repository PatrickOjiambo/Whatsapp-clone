import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pash_app/whatsapp_pages/tab.dart';

import 'authentication/signin.dart';
import 'firebase_options.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        splashColor: const Color.fromARGB(179, 39, 37, 37),
      ),
      home: const WhatsAppTab(),
    );
  }
}
