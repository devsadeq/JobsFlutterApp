import 'package:get/get.dart';

import '../../../data/remote/base/status.dart';
import '../../../data/remote/dto/customer/customer_profile_out_dto.dart';
import '../../../data/remote/repositories/customer/customer_repository.dart';
import '../../../di/locator.dart';
import '../../../widgets/dialogs.dart';
import '../../auth/controllers/auth_controller.dart';

class CustomerProfileController extends GetxController {
  final customerRepository = getIt.get<CustomerRepository>();

  final Rx<Status<CustomerProfileOutDto>> _rxProfile =
      Rx(const Status.loading());

  Status<CustomerProfileOutDto> get profile => _rxProfile.value;

  @override
  void onInit() {
    super.onInit();
    loadPage();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getProfile() async {
    final state = await customerRepository.getProfile(
        customerUuid: AuthController.to.currentUser!.id!);
    _rxProfile.value = state;
  }

  void loadPage() async {
    await getProfile();
    showDialogOnFailure();
  }

  void onRetry() async {
    _rxProfile.value = const Status.loading();
    await getProfile();
    showDialogOnFailure();
  }

  void showDialogOnFailure() {
    if (profile is Failure) {
      Dialogs.spaceDialog(
        description: (profile as Failure).reason.toString(),
        btnOkOnPress: onRetry,
        dismissOnBackKeyPress: false,
        dismissOnTouchOutside: false,
      );
    }
  }
}
