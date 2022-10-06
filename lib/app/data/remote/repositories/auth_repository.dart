import 'package:dio/dio.dart';

import '../../local/base/i_entity.dart';
import '../../local/services/storage_service.dart';
import '../base/iauth_repository.dart';
import '../base/idto.dart';
import '../base/status.dart';
import '../dto/auth/login_out_dto.dart';
import '../dto/auth/register_company_out_dto.dart';
import '../dto/auth/register_customer_out_dto.dart';
import '../exceptions/dio_exceptions.dart';
import '../services/auth_service.dart';

class AuthRepository implements IAuthRepository<Status<dynamic>> {
  final AuthService authService;
  final StorageService storageService;

  AuthRepository({
    required this.authService,
    required this.storageService,
  });

  @override
  Future<Status<LoginOutDto>> login({required IDto dto}) async {
    try {
      final response = await authService.login(dto: dto);
      if (response.statusCode == 200) {
        return Status.success(data: LoginOutDto.fromJson(response.data));
      } else if (response.statusCode == 400 || response.statusCode == 404) {
        return Status.failure(reason: response.data['error']);
      }
      return const Status.failure(reason: "Something went wrong!");
    } on DioError catch (e) {
      final errMsg = DioExceptions.fromDioError(e).toString();
      throw errMsg;
    }
  }

  @override
  Future<Status<RegisterCompanyOutDto>> registerCompany(
      {required IDto dto}) async {
    try {
      final response = await authService.registerCompany(dto: dto);
      if (response.statusCode == 201) {
        return Status.success(
            data: RegisterCompanyOutDto.fromJson(response.data));
      } else if (response.statusCode == 400 || response.statusCode == 403) {
        return Status.failure(reason: response.data['error']);
      }
      return const Status.failure(reason: "Something went wrong!");
    } on DioError catch (e) {
      final errMsg = DioExceptions.fromDioError(e).toString();
      throw errMsg;
    }
  }

  @override
  Future<Status<RegisterCustomerOutDto>> registerCustomer(
      {required IDto dto}) async {
    try {
      final response = await authService.registerCustomer(dto: dto);
      if (response.statusCode == 201) {
        return Status.success(
            data: RegisterCustomerOutDto.fromJson(response.data));
      } else if (response.statusCode == 400 || response.statusCode == 403) {
        return Status.failure(reason: response.data['error']);
      }
      return const Status.failure(reason: "Something went wrong!");
    } on DioError catch (e) {
      final errMsg = DioExceptions.fromDioError(e).toString();
      throw errMsg;
    }
  }

  /*
  * Local Storage
  * */
  @override
  Future<Status<dynamic>> readStorage({required String key}) async {
    try {
      final result = await storageService.read(key: key);
      if (result != null) return Status.success(data: result);
      return const Status.failure(reason: "Not Found!");
    } catch (e) {
      return Status.failure(reason: e.toString());
    }
  }

  @override
  Future<Status> writeStorage({
    required String key,
    required IEntity entity,
  }) async {
    try {
      await storageService.write(key: key, entity: entity);
      return const Status.success(data: "User has been saved successfully.");
    } catch (e) {
      return Status.failure(reason: e.toString());
    }
  }

  @override
  Future<Status> removeStorage({required String key}) async {
    try {
      await storageService.remove(key: key);
      return const Status.success(data: "User has been removed successfully.");
    } catch (e) {
      return Status.failure(reason: e.toString());
    }
  }
}
