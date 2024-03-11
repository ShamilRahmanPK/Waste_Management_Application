import 'package:flutter/material.dart';
import 'package:hksena/features/user/view/paymentss.dart';

class Wetwaste extends StatefulWidget {
  const Wetwaste({super.key});

  @override
  State<Wetwaste> createState() => _WetwasteState();
}

class _WetwasteState extends State<Wetwaste> {
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
              padding: EdgeInsets.only(left: 40,top: 40),
              height: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xff006937)
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset("assests/images/default_profie.png",height: 29,),
                      SizedBox(width: 20,),
                      Text("Shamil Rahman PK",style: TextStyle(fontSize: 15,color: Colors.white),)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Image.asset("assests/images/adress.png",height: 29,),
                      SizedBox(width: 20,),
                      Text("New York,north street \n house no:3221 ",style: TextStyle(fontSize: 15,color: Colors.white),)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Image.asset("assests/images/phone-call.png",height: 29,),
                      SizedBox(width: 20,),
                      Text("New York,north street \n house no:3221 ",style: TextStyle(fontSize: 15,color: Colors.white),)
                    ],
                  )
                ],
              ),
            ),
            Positioned(
                top: 250,
                child: Container(
              height: 550,
              width: MediaQuery.of(context).size.width,
              // width: 415,
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
              ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          Text(""),
                          Image.asset("assests/images/bluebin.png",height: 129,),
                        ],
                      ),
                      SizedBox(height: 40,),
                      Container(
                        child: Text("Choose your payment method",style: TextStyle(
                          fontSize: 17,
                          letterSpacing: 1,
                        ),),
                      )
                    ],
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

                      child: Container(
                        height: 70,

                        color: Color(0xff2B3641),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: (){

                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentSuccess()));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 70,
                          color: Color(0xff006937),
                          child: Text("NEXT",style: TextStyle(
                            fontSize: 17,
                            letterSpacing: 2,
                            color: Colors.white
                          ),),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
