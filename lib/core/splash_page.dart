import 'package:flutter/material.dart';
import 'package:hksena/core/login.dart';
import 'package:hksena/features/admin/view/admin.dart';
import 'package:hksena/features/agents/view/agents.dart';
import 'package:hksena/features/user/view/add_bin.dart';
import 'package:hksena/features/user/view/homepage.dart';
import 'package:hksena/features/user/view/paymentss.dart';
import 'package:hksena/features/user/view/registration.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => Login()), (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                'assests/images/logo.webp',
                height: 150,
              ),
            ),
            Text("Haritha Karma sena")
          ],
        ),
      ),
    );
  }
}
