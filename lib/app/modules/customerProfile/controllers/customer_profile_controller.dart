import 'package:get/get.dart';

import '../../../data/remote/base/status.dart';
import '../../../data/remote/dto/customer/customer_profile_out_dto.dart';
import '../../../data/remote/repositories/customer/customer_repository.dart';
import '../../../di/locator.dart';
import '../../auth/controllers/auth_controller.dart';

class CustomerProfileController extends GetxController {
  final customerRepository = getIt.get<CustomerRepository>();

  final Rx<Status<CustomerProfileOutDto>> _rxProfile =
      Rx(const Status.loading());

  Status<CustomerProfileOutDto> get profile => _rxProfile.value;

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getProfile() {
    _rxProfile.value = const Status.loading();
    customerRepository
        .getProfile(customerUuid: AuthController.to.currentUser!.id!)
        .then((profile) {
      _rxProfile.value = profile;
    });
  }
}
