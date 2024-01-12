import 'package:flutter/material.dart';

class Admin_payment extends StatefulWidget {
  const Admin_payment({super.key});

  @override
  State<Admin_payment> createState() => _Admin_paymentState();
}

class _Admin_paymentState extends State<Admin_payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff006937),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Payment",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            Image.asset(
              "assests/images/logo1.png",
              height: 50,
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.all(15),
            color: Colors.grey.shade400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("ID",style: TextStyle(
                  fontSize: 18,
                ),),
                Text("Name",style: TextStyle(
                  fontSize: 18,
                ),),
                Text("Date",style: TextStyle(
                  fontSize: 18,
                ),),
                Text("Amount",style: TextStyle(
                  fontSize: 18,
                ),),
              ],
            ),
          ),
          Expanded(child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext, index) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("#1089",style: TextStyle(
                      fontSize: 18,
                    ),),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Shamil Rahman",style: TextStyle(
                          fontSize: 18,
                        ),),
                        Text("Home",style: TextStyle(color: Colors.grey),)
                      ],
                    ),
                    Text("25/12/2023",style: TextStyle(
                      fontSize: 16,
                    ),),
                    Text("Rs.50",style: TextStyle(
                      fontSize: 18,
                    ),),
                  ],
                ),
                Divider(
                  color: Colors.grey,
                  height: 20,
                  thickness: 1,
                ),
              ],
            );
          }))
        ],
      ),
    );
  }
}
