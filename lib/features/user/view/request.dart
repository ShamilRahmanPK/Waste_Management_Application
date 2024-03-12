import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hksena/checkout/checkout_page.dart';
import 'package:hksena/features/user/view/add_bin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;
import '../../../models/request_model.dart';
import '../../../services/request_service.dart';

class Request extends StatefulWidget {
  final uid;
  const Request({Key? key, this.uid}) : super(key: key);

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
  String? uid;
  String? name;
  String? email;
  String? ward;
  String? phone;
  String? address;
  String? type;
  String? location;
  String? token;

  getData() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    try {
      uid = _prefs.getString('uid');
      name = _prefs.getString('name');
      email = _prefs.getString('email');
      address = _prefs.getString('address');
      ward = _prefs.getString('wardNo');
      phone = _prefs.getString('phone');
      location = _prefs.getString('location');
      token = _prefs.getString('token');
      type = _prefs.getString('type');

      setState(() {});
      // You can save additional data to SharedPreferences if needed
    } catch (error) {
      print("Error saving user data to SharedPreferences: $error");
    }
  }

  var walletBalance;

  @override
  void initState() {
    super.initState();
    getData();
    getWalletBalance();
  }

  TextEditingController _amountController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
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
            )
          ],
        ),
      ),
      body: Builder(
        builder: (BuildContext scaffoldContext) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your Bins",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "Wallet Balance: $walletBalance",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                            ),
                          ),
                          if (walletBalance != null && walletBalance < 50)
                            InkWell(
                              onTap: () {
                                final _key = GlobalKey<FormState>();
                                showDialog(
                                  context: scaffoldContext,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Container(
                                        padding: EdgeInsets.all(20),
                                        height: 180,
                                        child: Form(
                                          key: _key,
                                          child: Column(
                                            children: [
                                              TextFormField(
                                                decoration: InputDecoration(
                                                  hintText: "Enter Amount",
                                                ),
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Enter a valid amount";
                                                  } else if (int.parse(value) <
                                                      50) {
                                                    return "Amount should be greater than 50";
                                                  }
                                                },
                                                keyboardType:
                                                    TextInputType.number,
                                                controller: _amountController,
                                              ),
                                              SizedBox(height: 20),
                                              ElevatedButton(
                                                onPressed: () {
                                                  if (_key.currentState!
                                                      .validate()) {
                                                    Navigator.pop(context);
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            CheckoutPage(
                                                          data: {
                                                            "title":
                                                                "Wallet Recharge"
                                                          },
                                                          totalPrice: double.parse(
                                                              _amountController
                                                                      .text +
                                                                  ".0"),
                                                          balance: double.parse(
                                                              walletBalance
                                                                  .toString()),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                                child: Text("Pay Now"),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Text("Recharge Now"),
                            )
                          else
                            Text(""),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Display added bins here
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('user_bins')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return CircularProgressIndicator();
                      } else if (snapshot.data!.docs.length == 0) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("No Baskets Added"),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Add_bin(),
                                    ),
                                  );
                                },
                                child: Text("Click to Add Bins"),
                              ),
                            ],
                          ),
                        );
                      }
                      if (snapshot.hasData) {
                        List<Widget> binWidgets = [];
                        snapshot.data!.docs.forEach((doc) {
                          // Check if the document belongs to the current user
                          if (doc['uid'] == getCurrentUserId()) {
                            // Extract bin data from document
                            List<dynamic> bins = doc['bins'];

                            bins.forEach((bin) {
                              // Create a widget for each bin
                              Widget binWidget = Card(
                                elevation: 5.0,
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              "${bin['img']}",
                                              height: 100,
                                            ),
                                            SizedBox(width: 10),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${bin['type'].toUpperCase()}",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  "Fee: ${bin['price']}",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                // You can display other bin details here
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Transform(
                                        transform:
                                            Matrix4.rotationZ(math.pi / -8),
                                        child: IconButton(
                                          onPressed: () {
                                            walletBalance > 50
                                                ? showModalBottomSheet(
                                                    context: scaffoldContext,
                                                    builder: (context) {
                                                      return StatefulBuilder(
                                                        builder: (BuildContext
                                                                context,
                                                            StateSetter
                                                                setState) {
                                                          return Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    20),
                                                            height: 150,
                                                            child: Row(
                                                              children: [
                                                                Image.asset(
                                                                  "${bin['img']}",
                                                                  height: 100,
                                                                ),
                                                                SizedBox(
                                                                    width: 20),
                                                                Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      "${bin['type'].toUpperCase()}",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            10),
                                                                    Text(
                                                                      "Fee: ${bin['price']}",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                    width: 20),
                                                                ElevatedButton(
                                                                  style:
                                                                      ButtonStyle(
                                                                    backgroundColor:
                                                                        MaterialStateProperty.all(
                                                                            Colors.green),
                                                                    textStyle: MaterialStateProperty.all(
                                                                        TextStyle(
                                                                            color:
                                                                                Colors.white)),
                                                                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                                                                        vertical:
                                                                            12,
                                                                        horizontal:
                                                                            24)),
                                                                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8))),
                                                                    elevation:
                                                                        MaterialStateProperty
                                                                            .all(4),
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    sendRequest(
                                                                        bin);
                                                                  },
                                                                  child: Text(
                                                                    "Send ",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  )
                                                : showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        title: Text("Wallet Balance Low"),
                                                        actions: [
                                                          ElevatedButton(onPressed: (){
                                                            Navigator.pop(context);
                                                          }, child: Text("Cancel"))
                                                        ],
                                                        content: Container(
                                                          height: 100,
                                                          child: Center(
                                                            child: Text(
                                                                "Insiffcient Balance"),
                                                          ),
                                                        ),
                                                      );
                                                    });
                                          },
                                          icon: Icon(Icons.send,
                                              color: Colors.red),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                              binWidgets.add(binWidget);
                            });
                          }
                        });
                        return Column(
                          children: binWidgets,
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String? getCurrentUserId() {
    return uid;
  }

  Future<void> getWalletBalance() async {
    var snap = await FirebaseFirestore.instance
        .collection('wallet')
        .doc(widget.uid)
        .get();
    setState(() {
      walletBalance = snap['amount'];
    });
  }

  Future<void> sendRequest(Map<String, dynamic> bin) async {
    try {
      if (uid != null &&
          name != null &&
          email != null &&
          phone != null &&
          address != null &&
          ward != null) {
        RequestModel request = RequestModel(
          userId: uid!,
          userName: name!,
          userEmail: email!,
          userPhone: phone!,
          userAddress: address!,
          wardNo: ward!,
          agentId: "null",
          selectedBins: [BinItem.fromMap(bin)],
        );
        RequestService requestService = RequestService();
        await requestService.addRequest(request);

        FirebaseFirestore.instance
            .collection('wallet')
            .doc(widget.uid)
            .update({'amount': walletBalance - bin['price'],'points':50});
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text("Request sent successfully"),
          ),
        );
        Navigator.pop(context); // Close the bottom sheet
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Missing user information. Unable to send request."),
          ),
        );
      }
    } catch (error) {
      print("Error sending request: $error");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to send request"),
        ),
      );
    }
  }
}
