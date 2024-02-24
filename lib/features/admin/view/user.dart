import 'package:cloud_firestore/cloud_firestore.dart';
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
            child: StreamBuilder(stream:FirebaseFirestore.instance.collection('houses').orderBy('createdat').snapshots(), builder: (context,snapshot){
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if(snapshot.hasError){

                return Center(
                  child:Text("Some Error ccured ") ,
                );
              }

              if(snapshot.hasData && snapshot.data!.docs.length==0){

                return Center(
                  child: Text("No house added"),

                );
              }

              return  ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context,int index){

                    final user=snapshot.data!.docs[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color:user['status'] ==0?Colors.red:Colors.teal,
                        elevation: 5.0,
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 25,
                            child: Text("${index+1}"),

                          ),
                          title: Text("${user['name']}",style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),),
                          subtitle: Text("${user['address']}",style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),),
                          trailing: IconButton(
                            onPressed: (){

                              Map<String,dynamic> formData={};


                             showDialog(context: context, builder: (context){


                               return AlertDialog(

                                 content:  Container(

                                 height: 300,
                                 width: MediaQuery.of(context).size.width,

                                 child: Form(
                                   child: SingleChildScrollView(
                                     child: Column(
                                       children: [

                                         Row(
                                           mainAxisAlignment: MainAxisAlignment.end,
                                           children: [

                                         user['status']==1?    IconButton(onPressed: (){

                                               FirebaseFirestore.instance.collection('houses').doc(user['uid']).update(
                                                   {'status': 0});
                                               Navigator.pop(context);

                                             }, icon: Icon(Icons.delete,color: Colors.red,)):

                                         IconButton(onPressed: (){

                                           FirebaseFirestore.instance.collection('houses').doc(user['uid']).update(
                                               {'status': 1});
                                           Navigator.pop(context);

                                         }, icon: Icon(Icons.check,color: Colors.green,))
                                           ],
                                         ),

                                         TextField(

                                           controller: TextEditingController(text: user['name']),
                                           onSubmitted: (value){

                                             formData['name']=value;


                                           },


                                         ),
                                         TextField(

                                           controller: TextEditingController(text: user['address']),
                                           onSubmitted: (value){

                                             formData['address']=value;


                                           },


                                         ),
                                         TextField(

                                           controller: TextEditingController(text: user['houseName']),
                                           onSubmitted: (value){

                                             formData['houseName']=value;


                                           },


                                         ),
                                         TextField(

                                           controller: TextEditingController(text: user['houseNo']),
                                           onSubmitted: (value){

                                             formData['houseNo']=value;


                                           },


                                         ),
                                         TextField(

                                           controller: TextEditingController(text: user['wardNo']),
                                           onSubmitted: (value){

                                             formData['wardNo']=value;


                                           },


                                         ),

                                         ElevatedButton(onPressed: (){

                                           FirebaseFirestore.instance.collection('houses').doc(user['uid']).update(formData);
                                           Navigator.pop(context);
                                         }, child: Text("Update"))

                                       ],
                                     ),
                                   ),
                                 ),

                               ),
                               );

                              });

                            },
                            icon:
                            Icon(Icons.edit,color: Colors.black54,),
                          ),
                        ),
                      ),
                    );
                  }
              );

            }),
          )





        ],
      ),
    );
  }
}
