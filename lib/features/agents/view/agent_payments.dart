import 'package:flutter/material.dart';

class Agent_payments extends StatefulWidget {
  const Agent_payments({super.key});

  @override
  State<Agent_payments> createState() => _Agent_paymentsState();
}

class _Agent_paymentsState extends State<Agent_payments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff006937),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Payements",
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
                return Card(
                  child: ListTile(
                    leading: Text("#1089"),
                    title: Text("Shamil Rahman PK"),
                    subtitle: Text("Home"),
                    trailing: Text("Rs.50"),
                  ),
                );
                // return Column(
                //   children: [
                //     SizedBox(height: 30,),
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                //       children: [
                //         Text("#1089",style: TextStyle(
                //           fontSize: 18,
                //           color: Colors.blueAccent
                //         ),),
                //         Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text("Shamil Rahman",style: TextStyle(
                //               fontSize: 18,
                //             ),),
                //             Text("Home",style: TextStyle(color: Colors.grey),)
                //           ],
                //         ),
                //         Text("25/12/2023",style: TextStyle(
                //           fontSize: 16,
                //         ),),
                //         Text("Rs.50",style: TextStyle(
                //           fontSize: 18,
                //         ),),
                //       ],
                //     ),
                //     SizedBox(height: 30,),
                //     Divider(
                //       color: Colors.grey,
                //       height: 20,
                //       thickness: 1,
                //     ),
                //   ],
                // );
              }))
        ],
      ),
    );
  }
}
