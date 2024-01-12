import 'package:flutter/material.dart';

class Agent_complaints extends StatefulWidget {
  const Agent_complaints({super.key});

  @override
  State<Agent_complaints> createState() => _Agent_complaintsState();
}

class _Agent_complaintsState extends State<Agent_complaints> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff006937),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Complaints",
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.w400, color: Colors.white),
            ),
            Image.asset("assests/images/logo1.png",height: 50,)
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            color: Colors.grey.shade400,
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("ID",style: TextStyle(
              fontSize: 18,
            ),),
                Text("Name",style: TextStyle(
                  fontSize: 18,
                ),),
                Text("Complaint",style: TextStyle(
                  fontSize: 18,
                ),),
              ],
            ),
          ),
          Expanded(child: ListView.builder(
            itemCount: 10,
              itemBuilder: (BuildContext context,int index){
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          radius: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Shamil Rahman",style: TextStyle(
                              fontSize: 18,
                            ),),
                            Text("Home",style: TextStyle(color: Colors.grey),)
                          ],
                        ),
                        Text("Collection problem",style: TextStyle(
                          fontSize: 15
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
              }
          )
          )
        ],
      )
    );
  }
}
