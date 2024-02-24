import 'package:flutter/material.dart';

class My_acount extends StatefulWidget {
  const My_acount({super.key});

  @override
  State<My_acount> createState() => _My_acountState();
}

class _My_acountState extends State<My_acount> {
  @override
  Widget build(BuildContext context) {
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
                padding: EdgeInsets.only(top: 40),
                height: double.infinity,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Color(0xff006937)),
                child: Column(
                  children: [
                    Text("My Locality",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.white,letterSpacing: 1),),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assests/images/adress.png",
                          height: 35,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "New York,north street \n house no:3221 ",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: 200,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 550,
                    padding: EdgeInsets.only(top: 20, right: 30, left: 30),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "My Account",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assests/images/default_profie.png",
                                    height: 100,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Shamil Rahman PK",
                                    style: TextStyle(fontSize: 20, color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 80,
                                ),
                                Text(
                                  "My Points:400",
                                  style: TextStyle(fontSize: 20, color: Colors.black),
                                )
                              ],
                            ),
                          ],
                        ),
                SizedBox(height: 40,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Cards"),
                    SizedBox(height: 40,),
                    Text("My Points"),
                    SizedBox(height: 40,),
                    Text("Edit Acount"),
                    SizedBox(height: 70,),
                  ],
                )],
                    ),
                  )),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: (){

                          },
                          child: Container(
                            height: 70,
                            color: Color(0xff2B3641),
                            child: Center(
                              child: Text("Message",
                                style: TextStyle(
                                    fontSize: 18,
                                    letterSpacing: 2,
                                    color: Colors.white),),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: InkWell(
                          onTap: () {


                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 70,
                            color: Color(0xff006937),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assests/images/phone-call.png",height: 30,),
                                SizedBox(width: 20,),
                                Text(
                                  "Call",
                                  style: TextStyle(
                                      fontSize: 18,
                                      letterSpacing: 2,
                                      color: Colors.white),
                                ),
                              ],
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
        ));;
  }
}