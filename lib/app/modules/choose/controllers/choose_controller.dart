import 'package:get/get.dart';

import '../../../domain/enums/user_type.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/functions.dart';
import '../views/widgets/choose_bottom_sheet.dart';

class ChooseController extends GetxController {
  final Rx<UserType> _rxUserType = Rx(UserType.NOTSELECTED);

  UserType get userType => _rxUserType.value;

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

  updateType(UserType type) {
    _rxUserType.value = type;
    Get.toNamed(Routes.REGISTER, arguments: userType);
  }
}
