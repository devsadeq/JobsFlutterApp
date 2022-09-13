import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobs_flutter_app/app/modules/search/views/widgets/body.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      body: const body(),
    );
  }
}
