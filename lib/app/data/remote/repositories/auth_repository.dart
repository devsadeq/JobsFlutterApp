import 'package:dio/dio.dart';
import 'package:jobs_flutter_app/app/data/remote/base/idto.dart';
import 'package:jobs_flutter_app/app/data/remote/base/state.dart';
import 'package:jobs_flutter_app/app/data/remote/dto/auth/login_out_dto.dart';
import 'package:jobs_flutter_app/app/data/remote/dto/auth/register_company_dto.dart';
import 'package:jobs_flutter_app/app/data/remote/dto/auth/register_customer_dto.dart';
import 'package:jobs_flutter_app/app/data/remote/services/auth_service.dart';

import '../base/iauth_repository.dart';
import '../exceptions/dio_exceptions.dart';

class AuthRepository implements IAuthRepository<State<dynamic>> {
  final AuthService service;

  AuthRepository({required this.service});

  @override
  Future<State<LoginOutDto>> login({required IDto dto}) async {
    try {
      final response = await service.login(dto: dto);
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
  Future<State<RegisterCompanyDto>> registerCompany({required IDto dto}) async {
    try {
      final response = await service.registerCompany(dto: dto);
      if (response.statusCode == 201) {
        return State.success(data: RegisterCompanyDto.fromJson(response.data));
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
  Future<State<RegisterCustomerDto>> registerCustomer(
      {required IDto dto}) async {
    try {
      final response = await service.registerCustomer(dto: dto);
      if (response.statusCode == 201) {
        return State.success(data: RegisterCustomerDto.fromJson(response.data));
      } else if (response.statusCode == 400 || response.statusCode == 403) {
        return State.failure(reason: response.data['error']);
      }
      return const State.failure(reason: "Something went wrong!");
    } on DioError catch (e) {
      final errMsg = DioExceptions.fromDioError(e).toString();
      throw errMsg;
    }
  }
}
