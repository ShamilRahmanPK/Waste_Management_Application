import 'package:flutter/material.dart';
import 'package:hksena/features/user/view/wet_waste.dart';

class Request extends StatefulWidget {
  const Request({super.key});

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
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
            )
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Choose your waste type",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(height: 20,),
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Wetwaste()));
                            },
                            child: Container(
                              padding: EdgeInsets.all(20),
                              width: 155,
                              height: 225,
                              decoration:BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 2
                                )
                              ),
                              child: Column(
                                children: [
                                  Image.asset("assests/images/bluebin.png",height: 129,),
                                  SizedBox(height: 10,),
                                  Text("Wet waste",style: TextStyle(fontSize: 18),)
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            width: 155,
                            height: 225,
                            decoration:BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Colors.grey,
                                    width: 2
                                )
                            ),
                            child: Column(
                              children: [
                                Image.asset("assests/images/greenbin.png",height: 129,),
                                SizedBox(height: 10,),
                                Text("Wet waste",style: TextStyle(fontSize: 18),)
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            width: 155,
                            height: 225,
                            decoration:BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Colors.grey,
                                    width: 2
                                )
                            ),
                            child: Column(
                              children: [
                                Image.asset("assests/images/yellowbin.png",height: 129,),
                                SizedBox(height: 10,),
                                Text("Wet waste",style: TextStyle(fontSize: 18),)
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            width: 155,
                            height: 225,
                            decoration:BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Colors.grey,
                                    width: 2
                                )
                            ),
                            child: Column(
                              children: [
                                Image.asset("assests/images/redbin.png",height: 129,),
                                SizedBox(height: 10,),
                                Text("Wet waste",style: TextStyle(fontSize: 18),)
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            width: 155,
                            height: 225,
                            decoration:BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Colors.grey,
                                    width: 2
                                )
                            ),
                            child: Column(
                              children: [
                                Image.asset("assests/images/bluebin.png",height: 129,),
                                SizedBox(height: 10,),
                                Text("Wet waste",style: TextStyle(fontSize: 18),)
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            width: 155,
                            height: 225,
                            decoration:BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Colors.grey,
                                    width: 2
                                )
                            ),
                            child: Column(
                              children: [
                                Image.asset("assests/images/bluebin.png",height: 129,),
                                SizedBox(height: 10,),
                                Text("Wet waste",style: TextStyle(fontSize: 18),)
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
