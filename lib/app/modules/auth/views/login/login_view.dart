import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import 'widgets/body.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF5F8FA),
        resizeToAvoidBottomInset: false,
        body: Body(),
      ),
    );
  }
}
