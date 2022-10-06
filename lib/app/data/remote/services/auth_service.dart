import 'package:dio/src/response.dart';
import 'package:jobs_flutter_app/app/data/remote/base/idto.dart';

import '../../../utils/constants.dart';
import '../api/dio_client.dart';
import '../base/iauth_service.dart';

class AuthService implements IAuthService<IDto> {
  final DioClient dioClient;

  AuthService({required this.dioClient});

  @override
  Future<Response> login({required IDto dto}) async {
    try {
      return await dioClient.post(ApiRoutes.LOGIN, data: dto.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> registerCompany({required IDto dto}) async {
    try {
      return await dioClient.post(ApiRoutes.COMPANY_REGISTER,
          data: dto.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> registerCustomer({required IDto dto}) async {
    try {
      return await dioClient.post(ApiRoutes.CUSTOMER_REGISTER,
          data: dto.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
