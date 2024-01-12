import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Add_agent extends StatefulWidget {
  const Add_agent({super.key});

  @override
  State<Add_agent> createState() => _Add_agentState();
}

class _Add_agentState extends State<Add_agent> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmpasswordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _homeAddress = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _userName = TextEditingController();

  final _regKey=GlobalKey<FormState>();

  String?selectedItem;
  String?passwordInputValidator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff006937),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Add Agent",
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.w400, color: Colors.white),
            ),
            Image.asset("assests/images/logo1.png",height: 50,)
          ],
        ),
      ),
      body: Container(
          padding: EdgeInsets.only(left: 30, right: 30, top: 20),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(color: Colors.white),
          child: SingleChildScrollView(
            child: Form(
              key: _regKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    validator: (value){

                      if(value!.isEmpty){
                        return "* Full name is Mandatory";
                      }
                    },
                    controller: _nameController,
                    cursorColor: Colors.black38,
                    decoration: InputDecoration(
                      hintText: "Full Name",
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey,width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff006937),width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey,width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff006937),width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    validator: (value){

                      if(value!.isEmpty){
                        return "*  Please enter your address" ;
                      }

                    },
                    controller: _homeAddress,
                    cursorColor: Colors.black38,
                    decoration: InputDecoration(
                      hintText: "HomeAdress",
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey,width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff006937),width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey,width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff006937),width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value){

                      if(value!.isEmpty){
                        return "* Phone number is required";
                      }

                    },
                    controller: _phoneNumber,
                    cursorColor: Colors.black38,
                    decoration: InputDecoration(
                      hintText: "Phone Number",
                      fillColor: Colors.white,
                      errorStyle: TextStyle(fontStyle: FontStyle.italic),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey,width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff006937),width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey,width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff006937),width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField(

                      dropdownColor: Colors.white70,

                      decoration: InputDecoration(

                        hintText: "Collection area",
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey,width: 1.5),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff006937),width: 1.5),
                            borderRadius: BorderRadius.circular(10)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey,width: 1.5),
                            borderRadius: BorderRadius.circular(10)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff006937),width: 1.5),
                            borderRadius: BorderRadius.circular(10)),
                      ),


                      value: selectedItem,

                      items: ["Kunnapally","Perinthalmanna","Kattupara"].map(

                              (item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item))
                      ).toList(),
                      onChanged: (value){

                        setState(() {
                          selectedItem=value;
                        });

                      }

                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value){

                      if(value!.isEmpty){
                        return "Please enter a user name";
                      }

                    },
                    controller: _userName,
                    cursorColor: Colors.black38,
                    decoration: InputDecoration(
                      hintText: "User Name",
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey,width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff006937),width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey,width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff006937),width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _locationController,
                    cursorColor: Colors.black38,
                    decoration: InputDecoration(
                      hintText: "Location",
                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: IconButton(onPressed: (){

                      }, icon: Icon(Icons.add_location)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey,width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff006937),width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey,width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff006937),width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Login Details",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff006937)
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value){

                      if(value!.isEmpty){
                        return "* Email is required";
                      }

                    },
                    controller: _emailController,
                    cursorColor: Colors.black38,
                    decoration: InputDecoration(
                      hintText: "Email",
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey,width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff006937),width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey,width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff006937),width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value){

                      if(value!.isEmpty){
                        return "* Enter 8 digit password";
                      }

                    },
                    controller: _passwordController,
                    cursorColor: Colors.black38,
                    decoration: InputDecoration(
                      hintText: "Password",
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey,width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff006937),width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey,width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff006937),width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value){


                      if(value!.isEmpty){
                        return "Password does not match";
                      }

                    },
                    controller: _confirmpasswordController,
                    cursorColor: Colors.black38,
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey,width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff006937),width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey,width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff006937),width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () async{

                      if(_regKey.currentState!.validate()){

                        UserCredential user=await  FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
                        if(user!=null){
                          FirebaseFirestore.instance.collection('login').doc(user.user!.uid).set(


                              {
                                'name':_nameController.text,
                                'uid':user.user!.uid,
                                'createdat':DateTime.now(),
                                'status':1,
                                'password':_passwordController.text,
                                'usertype':"user"
                              }


                          ).then((value) {  FirebaseFirestore.instance.collection('houses').doc(user.user!.uid).set(


                              {

                                'name':_nameController.text,
                                'uid':user.user!.uid,
                                'createdat':DateTime.now(),
                                'status':1,
                                'password':_passwordController.text,
                              }

                          );});

                        }
                      }


                    },
                    child: Center(
                      child: Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff006937)),
                        child: Center(
                            child: Text(
                              "Register",
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
