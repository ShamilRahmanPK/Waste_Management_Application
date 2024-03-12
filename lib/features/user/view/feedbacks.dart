import 'package:flutter/material.dart';

class Feedbacks extends StatefulWidget {
  const Feedbacks({super.key});

  @override
  State<Feedbacks> createState() => _FeedbacksState();
}

class _FeedbacksState extends State<Feedbacks> {

   int click=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Feedbacks",style: TextStyle(color: Colors.black),)
          ],
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.only(top: 10,right: 20,left: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15,),
                  Text("Title",style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  ),),
                  SizedBox(height: 15,),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black12,
                      hintText: "Write feedback title",
                      labelStyle: TextStyle(
                        fontSize: 18,
                      ),
                      border: InputBorder.none
                    ),
                  ),
                  SizedBox(height: 15,),
                  Text("Comment",style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  ),),
                  SizedBox(height: 15,),
                  TextField(
                    maxLines: 10,
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.all(50),
                      filled: true,
                      fillColor: Colors.black12,
                      hintText: "Write your comment",
                      labelStyle: TextStyle(
                        fontSize: 18,
                      ),
                      border: InputBorder.none
                    ),
                  ),
                  SizedBox(height: 15,),
                  Text("Upload image (Optional)",style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                  ),),
                  SizedBox(height: 15,),
                  Icon(Icons.add_a_photo,size:80,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
