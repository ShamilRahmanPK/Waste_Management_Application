import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hksena/features/admin/view/add_agent.dart';
import 'package:hksena/features/agents/view/agent_acount.dart';
import 'package:hksena/features/agents/view/agents.dart';
import 'package:hksena/features/user/view/add_bin.dart';
import 'package:hksena/features/user/view/feedbacks.dart';
import 'package:hksena/features/user/view/message.dart';
import 'package:hksena/features/user/view/my_account.dart';
import 'package:hksena/features/user/view/my_agent.dart';
import 'package:hksena/features/user/view/request.dart';
import 'package:hksena/features/user/view/user_payments.dart';

class HomePage extends StatefulWidget {
  final DocumentSnapshot? data;
  const HomePage({super.key, this.data});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(children: [
          SizedBox(
            width: 10,
          ),
          Image.asset(
            "assests/images/logo1.png",
            height: 50,
          ),
        ]),
        leadingWidth: 90,
        backgroundColor: Color(0xff006937),
        toolbarHeight: 120,
        title: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            // ${widget.data!['name']}
            Text(
              "Good Morning,!",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            // Center(child: Text("Good Morning,${widget.data!['name']} !",style:
            //   TextStyle(
            //     fontSize: 20,
            //     fontWeight: FontWeight.w500,
            //
            //   ),)),
          ],
        ),
        actions: [
          InkWell(
              onTap: () {
                // showDialog(context: context, builder: (context)=>AlertDialog(
                //   content: Container(
                //     child: Text("Hi"),
                //   ),
                // ));
                showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                          height: 150,
                          color: Colors.white54,
                        ));
              },
              child: Image.asset(
                "assests/images/notificationon.png",
                width: 35,
              )),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assests/images/waste_managment.png"),
              fit: BoxFit.scaleDown,
            colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(0.6),
            BlendMode.dstATop,
          ),
          ),
        ),
        //width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 50, right: 50),
        margin: EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Request()));
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assests/images/sent_request.png")),
                              color: Color(0xff006937),
                              borderRadius: BorderRadius.circular(120)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Request",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Add_bin()));
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Color(0xff006937),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assests/images/add_basket.png")),
                              borderRadius: BorderRadius.circular(120)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Add Basket",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => My_agent()));
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Color(0xff006937),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assests/images/my_agent.png")),
                              borderRadius: BorderRadius.circular(120)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Agent",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => User_payments()));
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Color(0xff006937),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assests/images/payments.png")),
                              borderRadius: BorderRadius.circular(120)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Payment",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => My_acount()));
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Color(0xff006937),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assests/images/my_account.png"),fit: BoxFit.scaleDown),
                              borderRadius: BorderRadius.circular(120)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "My Account",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Message()));
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Color(0xff006937),
                              borderRadius: BorderRadius.circular(120)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Message",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Feedbacks()));
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Color(0xff006937),
                              borderRadius: BorderRadius.circular(120)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Feedbacks",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Agents()));
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Color(0xff006937),
                              borderRadius: BorderRadius.circular(120)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Complain",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
