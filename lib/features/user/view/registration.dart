import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hksena/features/user/view/homepage.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _homeAddress = TextEditingController();
  TextEditingController _wardNumber = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _userName = TextEditingController();




  @override
  Widget build(BuildContext context) {

    final _regKey=GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff006937),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Registration",
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
                        return "* Ward number is required";
                      }

                    },
                    controller: _wardNumber,
                    cursorColor: Colors.black38,
                    decoration: InputDecoration(
                      hintText: "Ward No:",
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
                  InkWell(
                    onTap: () async{

                   if(_regKey.currentState!.validate()){

                  _register();
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


  //register
  _register()async{

   try{
     UserCredential user=await  FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
     print(user.user!.email);

     if(user!=null){
       FirebaseFirestore.instance.collection('login').doc(user.user!.uid).set(


           {
             'name':_nameController.text,
             'email':user.user!.email,
             'uid':user.user!.uid,
             'createdat':DateTime.now(),
             'status':1,
             'password':_passwordController.text,
             'usertype':"house"
           }


       ).then((value) {  FirebaseFirestore.instance.collection('houses').doc(user.user!.uid).set(


           {

             'name':_nameController.text,
             'email':user.user!.email,
             'uid':user.user!.uid,
             'createdat':DateTime.now(),
             'status':1,
             'address':_homeAddress.text,
             'wardNo':_wardNumber.text,
             'phone':_phoneNumber.text,
             'loation':"",




           }

       );}).then((value)async {



         final userdata= await FirebaseFirestore.instance.collection('houses').doc(user.user!.uid).get();
         Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage(data: userdata,)), (route) => false);

       });

     }
   }on FirebaseAuthException catch(e){
     print(e);
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$e")));
   } on FirebaseException  catch(e){
     print(e);
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$e")));
   }
  }
}
