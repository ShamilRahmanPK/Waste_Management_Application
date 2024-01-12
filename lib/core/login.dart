import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hksena/features/admin/view/admin.dart';
import 'package:hksena/features/user/view/homepage.dart';
import 'package:hksena/features/user/view/registration.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();

  bool visible=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(height: 200,),
                  Text(
                    "Log in to Account",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 10,),
                      Text("Email",style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16
                      ),),
                    ],
                  ),
                  SizedBox(height: 5,),
                  TextFormField(
                    controller: _emailController,
                    cursorColor: Colors.black38,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey,width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffC1F2B0),width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Password",style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16
                      ),),
                    ],
                  ),
                  SizedBox(height: 5,),
                  TextFormField(

                    obscureText: visible,
                    controller: _passwordController,
                    cursorColor: Colors.black38,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(onPressed: (){

                        setState(() {
                          visible=!visible;
                        });

                      },icon: visible==true?Icon(Icons.visibility_off):Icon(Icons.visibility),),
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey,width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffC1F2B0),width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () async{

                      UserCredential _userrcredentials=await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);

                      if(_userrcredentials!=null){

                        final snap= await FirebaseFirestore.instance.collection('login').doc(_userrcredentials.user!.uid).get();

                        if(snap!=null){

                         if(snap['usertype']=='user'){

                           final userdata= await FirebaseFirestore.instance.collection('houses').doc(_userrcredentials.user!.uid).get();
                           Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage(data: userdata,)), (route) => false);


                         }
                        }


                      }

                    },
                    child: Container(
                      width: 120,
                      height: 45,
                      decoration: BoxDecoration(
                          color: Color(0xff006937), borderRadius: BorderRadius.circular(10)),
                      child: Center(child: Text("LOGIN",style: TextStyle(
                        color: Colors.white
                      ),)),
                    ),
                  ),
                  TextButton(onPressed: () {

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Registration()), );

                  }, child: Text("Register as HouseHold")),

                ],
              ),
              Container(
                child: Image.asset("assests/images/logo.webp",width: 100,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}