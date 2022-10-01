import 'package:dio/src/response.dart';

abstract class IAuthService<T> {
  Future<Response> registerCompany({required T dto});

  Future<Response> registerCustomer({required T dto});

  Future<Response> login({required T dto});
}
