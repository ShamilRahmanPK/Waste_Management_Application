

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hksena/features/user/view/add_bin.dart';
import 'package:hksena/features/user/view/request.dart';
import 'package:hksena/features/user/view/user_payments.dart';

class HomePage extends StatefulWidget {

  final DocumentSnapshot? data;
  const HomePage({super.key,this.data});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
            children: [
              SizedBox(width: 10,),
              Image.asset(
            "assests/images/logo1.png",
            height: 50,
          ),
            ]
        ),
          leadingWidth: 90,
          backgroundColor: Color(0xff006937),
          toolbarHeight: 120,
          title: Column(
            children: [
              SizedBox(height: 50,),
              Text("Good Morning,${widget.data!['name']}!",style:
              TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,

              ),),
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
              onTap: (){
                // showDialog(context: context, builder: (context)=>AlertDialog(
                //   content: Container(
                //     child: Text("Hi"),
                //   ),
                // ));
                showModalBottomSheet(context: context, builder: (context)=>Container(
                  height: 150,
                  color: Colors.red,
                ));
              },
                child: Image.asset("assests/images/notificationon.png",width: 35,)),
            SizedBox(width: 10,)
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: 800,
        //width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 40,right: 40,top: 20),
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
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Request()));
                        },
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(color: Color(0xff006937),borderRadius: BorderRadius.circular(120)),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text("Request",style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                      ),)
                    ],
                  ),
                  SizedBox(width: 40,),
                  Column(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Add_bin()));
                        },
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(color: Color(0xff006937),borderRadius: BorderRadius.circular(120)),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text("Add Basket",style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),)
                    ],
                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: (){

                        },
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(color: Color(0xff006937),borderRadius: BorderRadius.circular(120)),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text("Agent",style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),)
                    ],
                  ),
                  SizedBox(width: 40,),
                  Column(
                    children: [
                      InkWell(
                        onTap: (){

                          Navigator.push(context, MaterialPageRoute(builder: (context)=>User_payments()));

                        },
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(color: Color(0xff006937),borderRadius: BorderRadius.circular(120)),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text("Payment",style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),),

                    ],
                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Request()));
                        },
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(color: Color(0xff006937),borderRadius: BorderRadius.circular(120)),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text("My Account",style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),)
                    ],
                  ),
                  SizedBox(width: 40,),
                  Column(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Add_bin()));
                        },
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(color: Color(0xff006937),borderRadius: BorderRadius.circular(120)),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text("Message",style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),)
                    ],
                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Request()));
                        },
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(color: Color(0xff006937),borderRadius: BorderRadius.circular(120)),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text("Feedbacks",style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),)
                    ],
                  ),
                  SizedBox(width: 40,),
                  Column(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Add_bin()));
                        },
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(color: Color(0xff006937),borderRadius: BorderRadius.circular(120)),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text("Complain",style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),)
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
