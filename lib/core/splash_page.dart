import 'package:flutter/material.dart';
import 'package:hksena/core/login.dart';
import 'package:hksena/features/admin/view/admin.dart';
import 'package:hksena/features/agents/view/agents.dart';
import 'package:hksena/features/user/view/add_bin.dart';
import 'package:hksena/features/user/view/homepage.dart';
import 'package:hksena/features/user/view/paymentss.dart';
import 'package:hksena/features/user/view/registration.dart';
import 'package:hksena/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String? uid;
  String? name;
  String? email;
  String? ward;
  String? phone;
  String? addres;
  String? type;
  String? location;
  String? token;

  getData() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    try {
      uid = _prefs.getString(
        'uid',
      );
      name = _prefs.getString(
        'name',
      );
      _prefs.getString(
        'email',
      );
      _prefs.getString(
        'address',
      );
      ward = _prefs.getString(
        'wardNo',
      );
      phone = _prefs.getString(
        'phone',
      );
      location = _prefs.getString(
        'location',
      );
      token = _prefs.getString(
        'token',
      );
      type = _prefs.getString(
        'type',
      );

      setState(() {});
      // You can save additional data to SharedPreferences if needed
    } catch (error) {
      print("Error saving user data to SharedPreferences: $error");
    }
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      getData();
      checkStatus();
    });

    super.initState();
  }

  bool? status = false;
  checkStatus() async {
    AuthService _authService = AuthService();
    status = await _authService.checkLoginStatus();
    print(status);
    print(token);
    print(type);
    if (status == true) {
      if (type == "house") {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
            (route) => false);
      }

     else if (type == "shop") {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
                (route) => false);
      }

      else if (type == "agent") {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => AgentHome()),
                (route) => false);
      }
      else {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => Login()), (route) => false);
      }
    }else {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => Login()), (route) => false);
    }
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
