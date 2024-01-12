import 'package:flutter/material.dart';

class Add_bin extends StatefulWidget {
  const Add_bin({super.key});

  @override
  State<Add_bin> createState() => _Add_binState();
}

class _Add_binState extends State<Add_bin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff006937),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 5,
              ),
              Image.asset(
                "assests/images/logo1.png",
                height: 50,
              ),
            ],
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(left: 50, top: 40),
                height: double.infinity,
                decoration: BoxDecoration(color: Color(0xff006937)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assests/images/default_profie.png",
                          height: 29,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Shamil Rahman PK",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assests/images/adress.png",
                          height: 29,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "New York,north street \n house no:3221 ",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assests/images/phone-call.png",
                          height: 29,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "New York,north street \n house no:3221 ",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                  top: 250,
                  child: Container(
                    height: 550,
                    width: 415,
                    padding: EdgeInsets.only(top: 20, right: 20, left: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            "Choose your Bin",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assests/images/bluebin.png",
                                height: 129,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Eco-waste",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "items that are organic like food items,\n soiled food wrappers,hygiene products, \n yard waste, tissues and paper towels, as\n well as anyother soiled items that would\n contaminate the recyclables.",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: (){

                                },
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 15,
                                  child: Icon(Icons.circle_outlined,color: Colors.black,),
                                ),
                              )
                            ],
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 20,
                            thickness: 1.5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assests/images/redbin.png",
                                height: 129,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "E-waste",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "items that are organic like food items,\n soiled food wrappers,hygiene products, \n yard waste, tissues and paper towels, as\n well as anyother soiled items that would\n contaminate the recyclables.",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: (){

                                },
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 15,
                                  child: Icon(Icons.circle_outlined,color: Colors.black,),
                                ),
                              )
                            ],
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 20,
                            thickness: 1.5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assests/images/yellowbin.png",
                                height: 129,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Wet-waste",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "items that are organic like food items,\n soiled food wrappers,hygiene products, \n yard waste, tissues and paper towels, as\n well as anyother soiled items that would\n contaminate the recyclables.",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: (){

                                },
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 15,
                                  child: Icon(Icons.circle_outlined,color: Colors.black,),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 100,)
                        ],
                      ),
                    ),
                  )),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 70,
                          color: Color(0xff2B3641),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            height: 70,
                            color: Color(0xff006937),
                            child: Text(
                              "NEXT",
                              style: TextStyle(
                                  fontSize: 17,
                                  letterSpacing: 2,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
