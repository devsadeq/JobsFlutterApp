import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/remote/dto/auth/login_out_dto.dart';
import '../../../data/remote/dto/auth/register_company_dto.dart';
import '../../../data/remote/dto/auth/register_customer_dto.dart';
import '../../../data/remote/repositories/auth_repository.dart';
import '../../../di/locator.dart';
import '../../../data/remote/base/state.dart' as base;
import '../../../data/remote/dto/auth/login_in_dto.dart';
import '../../../domain/enums/user_type.dart';

class AuthController extends GetxController {
  final _authRepository = getIt.get<AuthRepository>();

  /*
  * Customer Form Fields.
  * */
  final GlobalKey<FormState> customerFormKey = GlobalKey<FormState>();
  final customerFullNameController = TextEditingController();
  final customerPhoneNumController = TextEditingController();
  final customerEmailController = TextEditingController();
  final customerPasswordController = TextEditingController();

  /*
  * Company Form Fields
  * */
  final GlobalKey<FormState> companyFormKey = GlobalKey<FormState>();
  final companyNameController = TextEditingController();
  final companyBusinessNumberController = TextEditingController();
  final companyBusinessEmailController = TextEditingController();
  final companyAddressController = TextEditingController();
  final companyCountryController = TextEditingController();
  final companyPasswordController = TextEditingController();

  /*
  * Login Form Fields
  * */
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();

  final Rx<base.State<dynamic>> _rxRegisterState =
      Rx<base.State<dynamic>>(const base.State.idle());

  base.State<dynamic> get registerCustomerState => _rxRegisterState.value;

  final Rx<base.State<LoginOutDto>> _rxLoginState =
      Rx<base.State<LoginOutDto>>(const base.State.idle());

  base.State get loginState => _rxLoginState.value;

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
    customerFullNameController.dispose();
    customerPhoneNumController.dispose();
    customerEmailController.dispose();
    customerPasswordController.dispose();
    companyNameController.dispose();
    companyBusinessEmailController.dispose();
    companyBusinessNumberController.dispose();
    companyCountryController.dispose();
    companyAddressController.dispose();
    companyPasswordController.dispose();
  }

  login() async {
    _rxLoginState.value = await _authRepository.login(
      dto: LoginInDto(
        email: loginEmailController.text,
        password: loginPasswordController.text,
      ),
    );
  }

  registerCustomer() async {
    _rxRegisterState.value = await _authRepository.registerCustomer(
      dto: RegisterCustomerDto(
        name: customerFullNameController.text,
        email: customerEmailController.text,
        password: customerPasswordController.text,
        phone: customerPhoneNumController.text,
      ),
    );
  }

  registerCompany() async {
    _rxRegisterState.value = await _authRepository.registerCompany(
      dto: RegisterCompanyDto(
        name: companyNameController.text,
        country: companyCountryController.text,
        address: companyAddressController.text,
        phone: companyBusinessNumberController.text,
        email: companyBusinessEmailController.text,
        password: companyPasswordController.text,
      ),
    );
  }

  onRegisterSubmit(UserType userType) {
    if (userType == UserType.CUSTOMER &&
        customerFormKey.currentState!.validate()) {
      registerCustomer();
    } else if (companyFormKey.currentState!.validate()) {
      registerCompany();
    }
  }

  onLoginSubmit() {
    if (loginFormKey.currentState!.validate()) {}
  }
}
