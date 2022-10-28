import 'package:dio/dio.dart';

abstract class ICompanyService {
  Future<Response> get({required String uuid});
}
