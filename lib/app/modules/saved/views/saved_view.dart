import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs_flutter_app/app/modules/saved/views/widgets/body.dart';
import 'package:jobs_flutter_app/app/widgets/custom_appbar.dart';
import '../controllers/saved_controller.dart';

class SavedView extends GetView<SavedController> {
  const SavedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.theme.backgroundColor,
        appBar: const CustomAppBar(title: "Saved Jobs"),
        body: const Body(),
      ),
    );
  }
}
