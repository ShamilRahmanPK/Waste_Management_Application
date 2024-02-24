import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Admin_reg extends StatefulWidget {
  const Admin_reg({super.key});

  @override
  State<Admin_reg> createState() => _Admin_regState();
}

class _Admin_regState extends State<Admin_reg> {
  String? selectedItem;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _houseName = TextEditingController();
  TextEditingController _houseNumber = TextEditingController();
  TextEditingController _ownerName = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _wardNumber = TextEditingController();
  TextEditingController _shopNumber = TextEditingController();
  TextEditingController _shopName = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _userName = TextEditingController();
  TextEditingController _userType = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _regKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff006937),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Registration",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            Image.asset(
              "assests/images/logo1.png",
              height: 50,
            )
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
                    validator: (value) {
                      if (selectedItem == "House") {
                        if (value!.isEmpty) {
                          return "* House is Mandatory";
                        }
                      } else {
                        if (value!.isEmpty) {
                          return "* Shop name is Mandatory";
                        }
                      }
                    },
                    controller:
                        selectedItem == "House"
                            ? _houseName
                            : _ownerName,
                    cursorColor: Colors.black38,
                    decoration: InputDecoration(
                      hintText:
                          selectedItem == "House" ? "House Name" : "Owner Name",
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff006937), width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff006937), width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  if (selectedItem == "Shop")
                    Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if(value!.isEmpty){
                              return "* Shop name is required";
                            };
                          },
                          controller: _shopName,
                          cursorColor: Colors.black38,
                          decoration: InputDecoration(
                            hintText: "Shop Name",
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.grey, width: 1.5),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff006937), width: 1.5),
                                borderRadius: BorderRadius.circular(10)),
                            errorBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.grey, width: 1.5),
                                borderRadius: BorderRadius.circular(10)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff006937), width: 1.5),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    )
                  else
                    SizedBox.shrink(),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "*  Please enter your address";
                      }
                    },
                    controller: _addressController,
                    cursorColor: Colors.black38,
                    decoration: InputDecoration(
                      hintText: selectedItem == "House"
                          ? "Home Address"
                          : "Shop Address",
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff006937), width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff006937), width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField(
                      dropdownColor: Color(0xff006937),
                      decoration: InputDecoration(
                        hintText: "User Type",
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.5),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff006937), width: 1.5),
                            borderRadius: BorderRadius.circular(10)),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.5),
                            borderRadius: BorderRadius.circular(10)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff006937), width: 1.5),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      value: selectedItem,
                      items: ["House", "Shop"]
                          .map((item) => DropdownMenuItem<String>(
                              value: item, child: Text(item)))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedItem = value;
                        });
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  if (selectedItem == "House")
                    Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if(value!.isEmpty){
                               return "* Ward No is required";
                            };
    },
                          controller: _wardNumber,
                          cursorColor: Colors.black38,
                          decoration: InputDecoration(
                            hintText: "Ward number",
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.5),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff006937), width: 1.5),
                                borderRadius: BorderRadius.circular(10)),
                            errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.5),
                                borderRadius: BorderRadius.circular(10)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff006937), width: 1.5),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    )
                  else
                    SizedBox.shrink(),
                  TextFormField(
                    validator: (value) {
                      if (selectedItem == "House") {
                        if (value!.isEmpty) {
                          return "* House number is Mandatory";
                        }
                      } else {
                        if (value!.isEmpty) {
                          return "* Shop number is Mandatory";
                        }
                      }
                    },
                    controller: selectedItem=="House"?_houseNumber:_shopNumber,
                    cursorColor: Colors.black38,
                    decoration: InputDecoration(
                      hintText:  selectedItem=="House"?"House number":"Shop number",
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff006937), width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff006937), width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
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
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff006937), width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff006937), width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
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
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff006937), width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff006937), width: 1.5),
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
                      suffixIcon: IconButton(
                          onPressed: () {}, icon: Icon(Icons.add_location)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff006937), width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff006937), width: 1.5),
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
                        color: Color(0xff006937)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
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
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff006937), width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff006937), width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
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
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff006937), width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff006937), width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () async {
                      if (_regKey.currentState!.validate()) {
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

  _register() async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);
      print(user.user!.email);

      if (user != null) {
        FirebaseFirestore.instance.collection('login').doc(user.user!.uid).set({
          'name': _userName.text,
          'email': user.user!.email,
          'uid': user.user!.uid,
          'createdat': DateTime.now(),
          'status': 1,
          'password': _passwordController.text,
          'usertype': selectedItem
        });

        if (selectedItem == "House") {
          FirebaseFirestore.instance
              .collection('houses')
              .doc(user.user!.uid)
              .set({
            'name' : _userName.text,
            'houseName': _houseName.text,
            'email': user.user!.email,
            'uid': user.user!.uid,
            'createdat': DateTime.now(),
            'status': 1,
            'address': _addressController.text,
            'wardNo': _wardNumber.text,
            'houseNo': _houseNumber.text,
            'phone': _phoneNumber.text,
            'loation': "",
          });
          final returnUser=FirebaseFirestore.instance.collection("house").doc(user.user!.uid).get();
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successfully registered $returnUser")));
        }
        else {
          FirebaseFirestore.instance
              .collection('shops')
              .doc(user.user!.uid)
              .set({
            'ownerName': _ownerName.text,
            'email': user.user!.email,
            'uid': user.user!.uid,
            'createdat': DateTime.now(),
            'status': 1,
            'address': _addressController.text,
            'ShopNumber': _shopNumber.text,
            'phone': _phoneNumber.text,
            'loation': "",
          });
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successfully registered $_userName")));
        }
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      final err = splitError(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("$err"),
        backgroundColor: Colors.red,
      ));
    } on FirebaseException catch (e) {
      print(e);
      final err = splitError(e.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("$err")));
    }
  }

  splitError(String e) {
    String error = e.split("]")[1];
    return error;
  }
}
