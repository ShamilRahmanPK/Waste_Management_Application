import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff006937),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Message",
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.w400, color: Colors.white),
            ),
            Image.asset("assests/images/logo1.png",height: 50,)
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(bottom: 5,right: 5,left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Container(),
            ),
            Container(
              height: 70,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(35)
                    ),
                    height: double.infinity,
                  ),
                  Positioned(
                    right: 5,
                      child: Container(
                        child: IconButton.filled(onPressed:(){
                          
                        },
                            icon: Icon(Icons.send,color: Colors.lightGreenAccent,)),
                        margin: EdgeInsets.all(5),
                        width: 80,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Color(0xff006937),
                        borderRadius: BorderRadius.circular(50))
                  )),
                  Positioned(
                    left: 5,
                      child: Container(
                        child: TextField(

                        ),
                        margin: EdgeInsets.only(top: 8,bottom: 8),
                        padding: EdgeInsets.only(right: 10,left: 10),
                        width: 300,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(50))
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
