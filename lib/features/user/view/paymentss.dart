import 'package:flutter/material.dart';

class Payment_success extends StatefulWidget {
  const Payment_success({super.key});

  @override
  State<Payment_success> createState() => _Payment_successState();
}

class _Payment_successState extends State<Payment_success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assests/images/successful_payment.png",height: 100,),
            Text("Congrats!",style: TextStyle(
                fontSize: 30,
              fontWeight: FontWeight.bold
            ),),
            Text("Successfully Booked your Collector",style: TextStyle(
                fontSize: 18
            ),),
            SizedBox(height: 20,),
            Text("You have earned ",style: TextStyle(
                fontSize: 18
            ),),
            Text("100 Points",style: TextStyle(
                fontSize: 30
            ),),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                
              },
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                    color: Color(0xff006937),
                ),
                child: Center(
                  child: Text("Back to Home",style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
