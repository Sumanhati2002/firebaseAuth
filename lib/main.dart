import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sample_firebase/crud_firebase/database_firebase.dart';

import 'email_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyDUQ17LiESb6J8-1fiMvFHT8UeI5wBUvqg',
          appId: '1:104627299013:android:637550ff05d2196ebcc6ac',
          messagingSenderId: '104627299013',
          projectId: 'samplefirebase-ed39d'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter 30 Widgets',
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.purple,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return const DatabaseOption();
            }
            else{
              return const EmailAuth();
            }
          },
        ));
  }
}
