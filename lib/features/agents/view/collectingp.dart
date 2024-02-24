import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Collecting_Points extends StatefulWidget {
  const Collecting_Points({super.key});

  @override
  State<Collecting_Points> createState() => _Collecting_PointsState();
}

class _Collecting_PointsState extends State<Collecting_Points> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff006937),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Collecting points",
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
                Text(
                  "ID",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  "Name",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  "Joined at",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext, index) {
                    return Card(
                      child: ListTile(
                        leading: Text("#1089"),
                        title: Text("Shamil Rahman PK"),
                        subtitle: Text("Home"),
                        trailing: Text("26/12/2026"),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
