import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../features/user/view/request.dart';

class InvoicePage extends StatefulWidget {
  final course;
  final String invoiceNumber;
  final String itemName;
  final double itemPrice;
  final int quantity;
  final double totalAmount;
  var orderId;
  var paymentId;
  var signature;
  final userid;

  InvoicePage({
    required this.course,
    required this.invoiceNumber,
    required this.itemName,
    required this.userid,
    required this.itemPrice,
    required this.quantity,
    required this.totalAmount,
    required this.orderId,
    required this.paymentId,
    required this.signature,
  });

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Invoice'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Invoice Number: ${widget.invoiceNumber}',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 16),
            Text(
              'Item: ${widget.itemName}',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 8),
            Divider(
              thickness: 1,
              color: Colors.teal,
            ),
            SizedBox(height: 20),
            Text(
              'Recarge Amount: \u{20B9}${widget.itemPrice.toStringAsFixed(2)}',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 20),
            Divider(
              thickness: 1.5,
              color: Colors.teal,
            ),
            SizedBox(height: 8),
            SizedBox(height: 8),
            Text(
              'Total Amount: \u{20B9}${widget.totalAmount.toStringAsFixed(2)}',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 16),
            Divider(
              thickness: 1.5,
              color: Colors.teal,
            ),
            Text(
              'Order ID: ${widget.orderId}',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
            SizedBox(height: 8),
            Divider(
              thickness: 1.5,
              color: Colors.teal,
            ),
            Text(
              'Payment ID: ${widget.paymentId}',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
            SizedBox(height: 8),
            Divider(
              thickness: 1.5,
              color: Colors.teal,
            ),
            Text(
              'Payment Status: Success',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.green),
            ),
            SizedBox(height: 20),
            Center(
                child: ElevatedButton(
              onPressed: () async {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Request(uid: widget.userid,)),
                    (route) => false);
              },
              child: Text(
                "Go to Request Page",
                style: TextStyle(color: Colors.black),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
