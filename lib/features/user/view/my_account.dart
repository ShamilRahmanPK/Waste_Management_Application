import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hksena/core/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../agents/view/message.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _AccountDetails {
  final String name;
  final String address;
  final int points;
  final String?location;
  final String?email;String?phone;
  final String?ward;

  _AccountDetails({required this.name, required this.address, required this.points,this.location,this.phone,this.ward,this.email,});
}

class _MyAccountState extends State<MyAccount> {
  late _AccountDetails _accountDetails = _AccountDetails(name: "", address: "", points: 0,location:"",phone: "",ward: "",email:"");
  late int _walletPoints=0;

  @override
  void initState() {
    super.initState();
    fetchAccountDetails();
    fetchWalletPoints();
  }

  Future<void> fetchAccountDetails() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String uid = prefs.getString('uid') ?? "";

      final DocumentSnapshot houseSnapshot = await FirebaseFirestore.instance.collection('houses').doc(uid).get();
      final houseData = houseSnapshot.data() as Map<String, dynamic>;

      final String name = houseData['name'] ?? "";
      final String address = houseData['address'] ?? "";
      final String email = houseData['email'] ?? "";
      final String phone = houseData['phone'] ?? "";
      final String location = houseData['location'] ?? "";
      final String ward = houseData['wardNo'] ?? "";

      final accountDetails = _AccountDetails(name: name, address: address, points: 0,location:location,phone: phone,ward: ward,email: email);
      setState(() {
        _accountDetails = accountDetails;
      });
    } catch (error) {
      print("Error fetching account details: $error");
    }
  }

  Future<void> fetchWalletPoints() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String uid = prefs.getString('uid') ?? "";

      final DocumentSnapshot walletSnapshot = await FirebaseFirestore.instance.collection('wallet').doc(uid).get();
      final walletData = walletSnapshot.data() as Map<String, dynamic>;

      final int points = walletData['points'] ?? 0;

      setState(() {
        _walletPoints = points;
      });
    } catch (error) {
      print("Error fetching wallet points: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff006937),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 5),
            Image.asset(
              "assests/images/logo1.png",
              height: 50,
            ),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(top: 40),
              height: double.infinity,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Color(0xff006937)),
              child: Column(
                children: [
                  Text(
                    "My Locality",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),

                  Text(
                    _accountDetails != null ? "Ward ${_accountDetails.ward!}" : "Loading...",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assests/images/adress.png",
                        height: 35,
                      ),
                      SizedBox(width: 20),
                      Text(
                        _accountDetails != null ? _accountDetails.address : "Loading...",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 200,
              bottom: 70,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 20, right: 30, left: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 20),
                          Text(
                            "My Account",
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 30),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assests/images/default_profie.png",
                                  height: 100,
                                ),
                                SizedBox(width: 20),
                                Text(
                                  _accountDetails != null ? _accountDetails.name : "Loading...",
                                  style: TextStyle(fontSize: 20, color: Colors.black),
                                ),
                                Text(
                                  "My Points: ${_walletPoints ?? 'Loading...'}",
                                  style: TextStyle(fontSize: 20, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),

                        ],
                      ),
                      SizedBox(height: 40),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Email"),
                          Text(
                            _accountDetails != null ? _accountDetails.email! : "Loading...",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          Text("Phone"),
                          SizedBox(height: 10),
                          Text(
                            _accountDetails != null ? _accountDetails.phone! : "Loading...",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Confirm Logout"),
                                content: Text("Are you sure you want to log out?"),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text("Cancel"),
                                    onPressed: () {
                                      Navigator.of(context).pop(); // Close the dialog
                                    },
                                  ),
                                  TextButton(
                                    child: Text("Logout"),
                                    onPressed: () async {
                                      final route = MaterialPageRoute(builder: (context) => Login());
                                      SharedPreferences _pref = await SharedPreferences.getInstance();
                                      _pref.clear();
                                      await FirebaseAuth.instance.signOut().then((value) => Navigator.pushAndRemoveUntil(context, route, (route) => false));
                                      // Perform logout operation
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          height: 70,
                          color: Color(0xff2B3641),
                          child: Center(
                            child: Text(
                              "Log Out",
                              style: TextStyle(fontSize: 18, letterSpacing: 2, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Message()));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 70,
                          color: Color(0xff006937),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Message",
                                style: TextStyle(fontSize: 18, letterSpacing: 2, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
