import 'package:flutter/material.dart';

import 'package:get/get.dart';


import '../../../icons.dart';
import '../controllers/choos_controller.dart';

class ChoosView extends GetView<ChoosController> {
  const ChoosView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F8FA),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 150),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(

                children: [
                  Image.asset('assets/Frame.png',
                  width: 400,
                  height: 400,)
                ],
              ),
              Container(
                width: double.infinity,
                height: 270,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight:Radius.circular(30) ),

                  ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 26),
                      color: Colors.black,
                      width: 28,
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Text("What are you looking for?",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 22,

                      ),),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        ElevatedButton(onPressed:(){},
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.only(top: 17,bottom: 17, left: 38, right: 38),
                              primary: Color(0xffFEFEFF),
                              onPrimary: Color(0xff1DA1F2),
                              side: BorderSide(color: Color(0x66657786),
                              width: 1.5),


                            ),
                            child: Column(
                              children: [

                                Icon(MyFlutterApp.briefcase),



                                Text('I want a job',
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                                ),

                              ],

                        )),
                        SizedBox(width: 10),
                        ElevatedButton(onPressed:(){},
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xffFEFEFF),
                                onPrimary: Color(0xff1DA1F2),
                                side: BorderSide(color: Color(0x66657786),
                                width: 1.5)
                            ),

                            child: Column(
                              children: [
                                Icon(Icons.person_rounded),

                                Text('I want an employee',
                                style: TextStyle(
                                  fontSize: 10
                                )

                                ),

                              ],

                            )),
                      ],
                    )
                  ],
                ),


                ),


            ],
          ),
        ),


      ),
    );
  }
}
