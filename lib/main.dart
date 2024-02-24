import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hksena/core/login.dart';
import 'package:hksena/core/splash_page.dart';
import 'package:hksena/features/admin/view/admin.dart';
import 'package:hksena/features/user/view/homepage.dart';
import 'package:hksena/features/user/view/registration.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
      theme: ThemeData(

        textTheme: TextTheme(
          displayLarge:TextStyle(color: Colors.black,fontSize: 22)
        ),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white
          )
        )
      ),
      home:SplashPage()
    );
  }
}
