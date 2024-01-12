import 'package:flutter/material.dart';

class User_list extends StatefulWidget {
  const User_list({super.key});

  @override
  State<User_list> createState() => _User_listState();
}

class _User_listState extends State<User_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff006937),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "All User",
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
            padding: EdgeInsets.only(top: 15,bottom: 10),
            color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    padding: EdgeInsets.only(right: 50),
                    child: Text("No:",style: TextStyle(
                      fontSize: 18,
                    ),)
                ),
                Container(
                    padding: EdgeInsets.only(right: 50),
                    child: Text("Name",style: TextStyle(
                      fontSize: 18,
                    ),)),
                Text("Edit",style: TextStyle(
                  fontSize: 18,
                ),),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 15,
                itemBuilder: (BuildContext context,int index){
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      child: Text("${index+1}"),

                    ),
                    title: Text("Shop1",style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),),
                    subtitle: Text("House name: Puthukudi",style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),),
                    trailing: IconButton(
                      onPressed: (){

                      },
                      icon:
                      Icon(Icons.edit,color: Colors.black54,),
                    ),
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}
