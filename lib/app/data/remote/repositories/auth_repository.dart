import 'package:dio/dio.dart';

import '../../local/services/storage_service.dart';
import '../base/iauth_repository.dart';
import '../base/idto.dart';
import '../base/state.dart';
import '../dto/auth/login_out_dto.dart';
import '../dto/auth/register_company_out_dto.dart';
import '../dto/auth/register_customer_out_dto.dart';
import '../exceptions/dio_exceptions.dart';
import '../services/auth_service.dart';

class AuthRepository implements IAuthRepository<State<dynamic>> {
  final AuthService authService;
  final StorageService storageService;

  AuthRepository({
    required this.authService,
    required this.storageService,
  });

  @override
  Future<State<LoginOutDto>> login({required IDto dto}) async {
    try {
      final response = await authService.login(dto: dto);
      if (response.statusCode == 200) {
        return State.success(data: LoginOutDto.fromJson(response.data));
      } else if (response.statusCode == 400 || response.statusCode == 404) {
        return State.failure(reason: response.data['error']);
      }
      return const State.failure(reason: "Something went wrong!");
    } on DioError catch (e) {
      final errMsg = DioExceptions.fromDioError(e).toString();
      throw errMsg;
    }
  }

  @override
  Future<State<RegisterCompanyOutDto>> registerCompany(
      {required IDto dto}) async {
    try {
      final response = await authService.registerCompany(dto: dto);
      if (response.statusCode == 201) {
        return State.success(
            data: RegisterCompanyOutDto.fromJson(response.data));
      } else if (response.statusCode == 400 || response.statusCode == 403) {
        return State.failure(reason: response.data['error']);
      }
      return const State.failure(reason: "Something went wrong!");
    } on DioError catch (e) {
      final errMsg = DioExceptions.fromDioError(e).toString();
      throw errMsg;
    }
  }

  @override
  Future<State<RegisterCustomerOutDto>> registerCustomer(
      {required IDto dto}) async {
    try {
      final response = await authService.registerCustomer(dto: dto);
      if (response.statusCode == 201) {
        return State.success(
            data: RegisterCustomerOutDto.fromJson(response.data));
      } else if (response.statusCode == 400 || response.statusCode == 403) {
        return State.failure(reason: response.data['error']);
      }
      return const State.failure(reason: "Something went wrong!");
    } on DioError catch (e) {
      final errMsg = DioExceptions.fromDioError(e).toString();
      throw errMsg;
    }
  }

  /*
  * Local Storage
  * */
  @override
  Future<State<dynamic>> readStorage({required String key}) async {
    try {
      final result = await storageService.read(key: key);
      if (result != null) return State.success(data: result);
      return const State.failure(reason: "Not Found!");
    } catch (e) {
      return State.failure(reason: e.toString());
    }
  }

  @override
  Future<State> writeStorage({required String key, required value}) async {
    try {
      await storageService.write(key: key, value: value);
      return const State.success(data: "User has been saved successfully.");
    } catch (e) {
      return State.failure(reason: e.toString());
    }
  }

  @override
  Future<State> removeStorage({required String key}) async {
    try {
      await storageService.write(key: key);
      return const State.success(data: "User has been removed successfully.");
    } catch (e) {
      return State.failure(reason: e.toString());
    }
  }
}
