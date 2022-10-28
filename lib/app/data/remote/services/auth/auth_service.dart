import 'package:dio/src/response.dart';

import '../../api/api_routes.dart';
import '../../api/dio_client.dart';
import 'i_auth_service.dart';
import '../../base/idto.dart';

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
