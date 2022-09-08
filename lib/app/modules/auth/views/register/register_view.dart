import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'widgets/body.dart';

class RegisterView extends GetView {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Body(),
      ),
    );
  }
}
