import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hksena/features/user/view/homepage.dart';

class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({Key? key});

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment History"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('payments')
            .where('userid', isEqualTo: "pOBFnJ6wjOcT96TaCAjdmKjzQ")
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
              var createdAt = doc['createdat'];
              var orderId = doc['orderId'];
              var paymentId = doc['paymentid'];
              var paymentTitle = doc['paymenttitle'];
              var settlementStatus = doc['settlementStatus'];
              var status = doc['status'];

              // Creating a ListTile for each transaction
              return ListTile(
                title: Text("Payment Title: $paymentTitle"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Amount: $amount"),
                    Text("Order ID: $orderId"),
                    Text("Booking ID: $bookingId"),
                    Text("Payment ID: $paymentId"),
                    Text("Created At: $createdAt"),
                    Text("Settlement Status: $settlementStatus"),
                    Text("Status: $status"),
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
