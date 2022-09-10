import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/waiting_controller.dart';

class WaitingView extends GetView<WaitingController> {
  const WaitingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Column(

          children: [
            Image.asset("assets/Ellipse 796.png"),
            SizedBox(height: 80,)
            ,
            Text(
              'THANK YOU!',
              style: TextStyle(fontSize: 42,
              fontWeight: FontWeight.w900),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text("For your Submission",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black45
                ),

              ),
            ), Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text("We are currently processing your request \n    and will get in touch with you shortly!",
              style: TextStyle(
                color: Colors.black38,
                fontSize: 16



              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 190),
              child: TextButton(onPressed: (){
                exit(0);
              },
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xff1DA1F2),
                    padding: EdgeInsets.only(top: 15, bottom: 15,left: 160, right: 160),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                  )
                  ),

                  
                  child: Text("Exit",style: TextStyle(
                    color: Colors.white,
                    
                  ),)

              ),
            )
          ],
        ),
      ),
    );
  }
}
