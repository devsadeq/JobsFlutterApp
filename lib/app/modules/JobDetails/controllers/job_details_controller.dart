import 'package:get/get.dart';
import 'package:jobs_flutter_app/app/utils/functions.dart';

import '../views/widgets/apply_bottom_sheet.dart';

class JobDetailsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    popupBottomSheet(const ApplyBottomSheetBody());
  }

  @override
  void onClose() {
    super.onClose();
  }
}
