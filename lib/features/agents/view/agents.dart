import 'package:flutter/material.dart';
import 'package:hksena/core/login.dart';
import 'package:hksena/features/agents/view/agent_acount.dart';
import 'package:hksena/features/agents/view/agent_payments.dart';
import 'package:hksena/features/agents/view/collectingp.dart';
import 'package:hksena/features/agents/view/message.dart';

class AgentHome extends StatefulWidget {
  const AgentHome({super.key});

  @override
  State<AgentHome> createState() => _AgentHomeState();
}

class _AgentHomeState extends State<AgentHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){},
        backgroundColor: Color(0xffEEB210),
        child: Icon(Icons.refresh),),
      appBar: AppBar(
          backgroundColor: Color(0xff006937),
          toolbarHeight: 70,
          title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Agent",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    Image.asset("assests/images/logo1.png",height: 50,)
                  ],
                ),
                Text(
                  "User: Shamil ",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                SizedBox(height: 10,),
              ])),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 5,bottom: 20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 30,
                padding: EdgeInsets.only(top: 5,left: 10),
                color: Color(0xff908989),
                child: Text("Notifications"),
              ),
              Container(
                height: 250,
                color: Color(0xffD9D9D9),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Collecting_Points()));

                },
                child: Container(
                  padding: EdgeInsets.only(left: 15),
                  alignment: Alignment.centerLeft,
                  height: 55,
                  width: 352,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff006937)),
                  child: Text(
                    "+ View all Collecting Points",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: Colors.white ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.only(left: 15),
                  alignment: Alignment.centerLeft,
                  height: 55,
                  width: 352,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff006937)),
                  child: Text(
                    "+ Request",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: Colors.white ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.only(left: 15),
                  alignment: Alignment.centerLeft,
                  height: 55,
                  width: 352,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff006937)),
                  child: Text(
                    "+ Payment Due",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: Colors.white ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Agent_payments()));
                  
                },
                child: Container(
                  padding: EdgeInsets.only(left: 15),
                  alignment: Alignment.centerLeft,
                  height: 55,
                  width: 352,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff006937)),
                  child: Text(
                    "+ View all Payments",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: Colors.white ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Message()));

                },
                child: Container(
                  padding: EdgeInsets.only(left: 15),
                  alignment: Alignment.centerLeft,
                  height: 55,
                  width: 352,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff006937)),
                  child: Text(
                    "+ Message",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: Colors.white ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.only(left: 15),
                  alignment: Alignment.centerLeft,
                  height: 55,
                  width: 352,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff006937)),
                  child: Text(
                    "+ Complaints/Reply",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: Colors.white ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.only(left: 15),
                  alignment: Alignment.centerLeft,
                  height: 55,
                  width: 352,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff006937)),
                  child: Text(
                    "+ Feedbacks",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: Colors.white ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Agent_acount()));

                },
                child: Container(
                  padding: EdgeInsets.only(left: 15),
                  alignment: Alignment.centerLeft,
                  height: 55,
                  width: 352,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff006937)),
                  child: Text(
                    "+ My Account",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: Colors.white ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
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
                            onPressed: () {
                              // Perform logout operation
                              final route = MaterialPageRoute(builder: (context) => Login());
                              Navigator.pushAndRemoveUntil(context, route, (route) => false);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  padding: EdgeInsets.only(left: 15),
                  alignment: Alignment.centerLeft,
                  height: 55,
                  width: 352,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                  ),
                  child: Text(
                    "+ Log Out",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
