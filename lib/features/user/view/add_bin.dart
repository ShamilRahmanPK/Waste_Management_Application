import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'package:hksena/features/user/view/add_bin_Items.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Add_bin extends StatefulWidget {
  const Add_bin({super.key});

  @override
  State<Add_bin> createState() => _Add_binState();
}

class _Add_binState extends State<Add_bin> {
  List<int> selectedIndices = [];
  int? selectedIndex;

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
      uid = _prefs.getString('uid');
      name = _prefs.getString('name');
      _prefs.getString('email');
      _prefs.getString('address');
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

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themedata = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff006937),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 5,
            ),
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
              padding: EdgeInsets.only(left: 50, top: 40),
              height: double.infinity,
              decoration: BoxDecoration(color: Color(0xff006937)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assests/images/default_profie.png",
                        height: 29,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        name ?? "Loading..",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assests/images/adress.png",
                        height: 29,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        location ?? "Loading",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assests/images/phone-call.png",
                        height: 29,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "$phone",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              top: 200,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 590,
                padding: EdgeInsets.only(top: 20, right: 10, left: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Column(
                  children: [
                    Text(
                      "Choose your Bin",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return Divider(
                            height: 3,
                            color: Colors.grey,
                          );
                        },
                        itemCount: bins.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  toggleSelection(index);
                                });
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    bins[index]['img'].toString(),
                                    height: 100,
                                  ),
                                  SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          bins[index]['title'].toString(),
                                          style: TextStyle(
                                            fontSize: 18,
                                            color:
                                                selectedIndices.contains(index)
                                                    ? Colors.green
                                                    : Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          bins[index]['details'].toString(),
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Price: ${bins[index]['price']}",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  CircleAvatar(
                                    backgroundColor:
                                        selectedIndices.contains(index)
                                            ? Colors.green
                                            : Colors.white,
                                    radius: 15,
                                    child: Icon(
                                      selectedIndices.contains(index)
                                          ? Icons.check
                                          : Icons.circle_outlined,
                                      color: selectedIndices.contains(index)
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      height: 150,
                    )
                  ],
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
                      child: Container(
                        height: 70,
                        color: Color(0xff2B3641),
                        child: Center(
                          child: Text(
                            "Total: ${calculateTotal()}",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: () {
                          // Store selected bin data to Firestore
                          storeSelectedBins();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 70,
                          color: Color(0xff006937),
                          child: Text(
                            "NEXT",
                            style: TextStyle(
                                fontSize: 17,
                                letterSpacing: 2,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void toggleSelection(int index) {
    if (selectedIndices.contains(index)) {
      selectedIndices.remove(index);
    } else {
      selectedIndices.add(index);
    }
  }

  // Calculate total amount
  double calculateTotal() {
    double total = 0;
    for (int index in selectedIndices) {
      total += double.parse(bins[index]['price'].toString());
    }
    return total;
  }

  // Store selected bin data to Firestore
  void storeSelectedBins() {
    FirebaseFirestore.instance.collection('user_bins').where('uid', isEqualTo: uid).get().then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        // Document exists for the user, update the existing document
        FirebaseFirestore.instance.collection('user_bins').doc(querySnapshot.docs.first.id).update({
          'bins': FieldValue.arrayUnion(selectedIndices.map((index) => bins[index]).toList()),
          // You can add more fields to update if needed
        }).then((value) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Bin Added Successfully")));
          Navigator.pop(context);
        }).catchError((error) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to add bin")));
        });
      } else {
        // Document doesn't exist for the user, create a new document
        FirebaseFirestore.instance.collection('user_bins').add({
          'uid': uid,
          'bins': selectedIndices.map((index) => bins[index]).toList(),
          // Add other data you want to store
        }).then((value) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Bin Added Successfully")));
          Navigator.pop(context);
        }).catchError((error) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to add bin")));
        });
      }
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to check user bins")));
    });
  }

}
