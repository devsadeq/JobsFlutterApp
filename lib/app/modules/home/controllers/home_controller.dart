import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt _indicatorIndex = 0.obs;

  int get indicatorIndex => _indicatorIndex.value;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  updateIndicatorValue(newIndex, _) {
    Get.printError(info: newIndex.toString());
    _indicatorIndex.value = newIndex;
    Get.printError(info: _indicatorIndex.value.toString());
  }
}
