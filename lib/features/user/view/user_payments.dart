import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hksena/features/user/view/homepage.dart';
import 'package:intl/intl.dart';

class UserPayments extends StatefulWidget {
  final uid;
  const UserPayments({Key? key,this.uid});

  @override
  State<UserPayments> createState() => _UserPaymentsState();
}

class _UserPaymentsState extends State<UserPayments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Payment History"),
      ),  
      body: Container(
        padding: EdgeInsets.all(20),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('payments')
              .where('userid', isEqualTo: "${widget.uid}")
              .orderBy('createdat', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text("No transactions found"));
            }
            return ListView(
              children: snapshot.data!.docs.map((doc) {
                // Extracting data from each payment document
                var amount = doc['amount'];
                var bookingId = doc['bookingid'];
                var createdAt = (doc['createdat'] as Timestamp).millisecondsSinceEpoch;
                var orderId = doc['orderId'];
                var paymentId = doc['paymentid'];
                var paymentTitle = doc['paymenttitle'];
                var settlementStatus = doc['settlementStatus'];
                var status = doc['status'];

                // Format createdAt to a readable date string
                var formattedDate =
                DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.fromMillisecondsSinceEpoch(createdAt));

                // Creating a ListTile for each transaction
                return Card(
                  elevation: 5.0,
                  child: ListTile(
                    title: Text("Payment Title: $paymentTitle"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Amount: $amount"),
                        Text("Order ID: $orderId"),
                        Text("Booking ID: $bookingId"),
                        Text("Payment ID: $paymentId"),
                        Text("Created At: $formattedDate"),
                        Text("Settlement Status: $settlementStatus"),
                        Text("Status: ${status==1?"Success":"Failed"}",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
