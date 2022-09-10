import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobs_flutter_app/app/modules/auth/views/login/login_view.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return splash();
  }
}

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 10), ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginView())));
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor:Color(0xff1DA1F2) ,
        body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Image.asset('assets/logo.png.png',
                  height:100 ,
                  width: 100,
                ),


              ),
              Text("Jobspot",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),


              )

            ],

          ),
        )
    );
  }
}

