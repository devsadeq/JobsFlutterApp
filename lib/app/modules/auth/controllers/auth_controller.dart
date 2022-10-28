import 'package:country_codes/country_codes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';

import '../../../data/local/entities/user_entity.dart';
import '../../../data/remote/base/status.dart';
import '../../../data/remote/dto/auth/login_in_dto.dart';
import '../../../data/remote/dto/auth/login_out_dto.dart';
import '../../../data/remote/dto/auth/register_company_dto.dart';
import '../../../data/remote/dto/auth/register_company_out_dto.dart';
import '../../../data/remote/dto/auth/register_customer_dto.dart';
import '../../../data/remote/dto/auth/register_customer_out_dto.dart';
import '../../../data/remote/repositories/auth/auth_repository.dart';
import '../../../di/locator.dart';
import '../../../domain/enums/user_type.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/functions.dart';
import '../../../widgets/snackbars.dart';
import '../views/login/widgets/choose_bottom_sheet.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();
  final _authRepository = getIt.get<AuthRepository>();
  final CountryDetails details = CountryCodes.detailsForLocale();

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

  /*
  * Rx
  * */

  late final RxString _rxCountry;

  String get country => _rxCountry.value;

  final Rxn<UserEntity> _rxnCurrentUser = Rxn<UserEntity>();

  UserEntity? get currentUser => _rxnCurrentUser.value;

  final Rx<Status<RegisterCustomerOutDto>> _rxRegisterCustomerState =
      Rx(const Status.idle());

  Status<RegisterCustomerOutDto> get registerCustomerState =>
      _rxRegisterCustomerState.value;

  final Rx<Status<RegisterCompanyOutDto>> _rxRegisterCompanyState =
      Rx(const Status.idle());

  Status<RegisterCompanyOutDto> get registerCompanyState =>
      _rxRegisterCompanyState.value;

  final Rx<Status<LoginOutDto>> _rxLoginState = Rx(const Status.idle());

  Status<LoginOutDto> get loginState => _rxLoginState.value;

  final RxBool _rxIsObscure = RxBool(true);

  bool get isObscure => _rxIsObscure.value;

  final Rx<RegisterType> _rxRegisterType = Rx(RegisterType.NOTSELECTED);

  RegisterType get registerType => _rxRegisterType.value;

  @override
  void onInit() {
    super.onInit();
    _getCurrentUser();
    _rxCountry = RxString(details.dialCode!);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    loginEmailController.dispose();
    loginPasswordController.dispose();
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

  void _getCurrentUser() async {
    final result = await _authRepository.readStorage(key: 'user');
    result.whenOrNull(
        success: (data) => _rxnCurrentUser.value = UserEntity.fromMap(data));
  }

  void onCountryChanged(Country country) {
    _rxCountry.value = "+${country.dialCode}";
  }

  void onLoginSubmit() {
    if (loginFormKey.currentState!.validate()) {
      _login();
    }
  }

  void onRegisterSubmit() {
    if (registerType == RegisterType.CUSTOMER &&
        customerFormKey.currentState!.validate()) {
      _registerCustomer();
    } else if (companyFormKey.currentState!.validate()) {
      _registerCompany();
    }
  }

  void logout() async {
    final result = await _authRepository.removeStorage(key: 'user');
    result.whenOrNull(success: (data) => Get.offAllNamed(Routes.LOGIN));
  }

  void _login() async {
    _rxLoginState.value = await _authRepository.login(
      dto: LoginInDto(
        emailOrPhone: loginEmailController.text,
        password: loginPasswordController.text,
      ),
    );
    loginState.whenOrNull(
      success: (data) {
        _saveUserInStorage(
          id: data!.id,
          email: data.email,
          name: data.name,
          token: data.token!.access,
          role: data.role,
          status: data.status,
        );
        _getCurrentUser();
        Get.offAllNamed(Routes.ROOT);
        _clearTextControllers();
      },
      failure: showSnackBarOnFailure,
    );
  }

  void _registerCustomer() async {
    _rxRegisterCustomerState.value = await _authRepository.registerCustomer(
      dto: RegisterCustomerDto(
        name: customerFullNameController.text,
        email: customerEmailController.text,
        password: customerPasswordController.text,
        phone: "$country${customerPhoneNumController.text}",
      ),
    );
    registerCustomerState.whenOrNull(
      success: (data) {
        _saveUserInStorage(
            id: data!.customer!.id,
            token: data.token!.access,
            name: data.customer!.name,
            email: data.customer!.email,
            phone: data.customer!.phone,
            role: "CUSTOMER",
            status: "APPROVED");
        _getCurrentUser();
        Get.offAllNamed(Routes.ROOT);
        _clearTextControllers();
      },
      failure: showSnackBarOnFailure,
    );
  }

  void _registerCompany() async {
    _rxRegisterCompanyState.value = await _authRepository.registerCompany(
      dto: RegisterCompanyDto(
        name: companyNameController.text,
        country: companyCountryController.text,
        address: companyAddressController.text,
        phone: "$country${companyBusinessNumberController.text}",
        email: companyBusinessEmailController.text,
        password: companyPasswordController.text,
      ),
    );
    registerCompanyState.whenOrNull(
      success: (data) {
        Get.offAllNamed(Routes.WAITTING);
        _clearTextControllers();
      },
      failure: showSnackBarOnFailure,
    );
  }

  void _saveUserInStorage({
    String? id,
    String? email,
    String? name,
    String? phone,
    String? token,
    String? role,
    String? status,
  }) async {
    await _authRepository.writeStorage(
      key: 'user',
      entity: UserEntity(
        id: id,
        name: name,
        email: email,
        phoneNumber: phone,
        token: token,
        role: role,
        status: status,
      ),
    );
  }

  void toggleObscurePassword() {
    _rxIsObscure.value = !isObscure;
  }

  void _clearTextControllers() {
    loginEmailController.clear();
    loginPasswordController.clear();
    customerFullNameController.clear();
    customerPhoneNumController.clear();
    customerEmailController.clear();
    customerPasswordController.clear();
    companyNameController.clear();
    companyBusinessEmailController.clear();
    companyBusinessNumberController.clear();
    companyCountryController.clear();
    companyAddressController.clear();
    companyPasswordController.clear();
  }

  void onSignUp() {
    popupBottomSheet(
      bottomSheetBody: const ChooseBottomSheetBody(),
      isDismissible: true,
      enableDrag: true,
    );
  }

  void onSelectRegisterType(RegisterType type) {
    if (type != RegisterType.NOTSELECTED) {
      _rxRegisterType.value = type;
      Get.offAllNamed(Routes.REGISTER);
    }
  }

  void showSnackBarOnFailure(String? err) {
    Get.closeAllSnackbars();
    SnackBars.failure("Oops!", err.toString());
  }
}
