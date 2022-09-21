import 'package:get/get.dart';
import 'package:jobs_flutter_app/app/utils/functions.dart';

import '../views/widgets/choose_bottom_sheet.dart';

class ChooseController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    popupBottomSheet(
      bottomSheetBody: const ChooseBottomSheetBody(),
      isDismissible: false,
      enableDrag: false,
    );
  }

  @override
  void onClose() {
    super.onClose();
  }
}
