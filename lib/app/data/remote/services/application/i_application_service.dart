import 'package:dio/dio.dart';

import '../../base/idto.dart';

abstract class IApplicationService {
  Future<Response> create({required IDto dto});

  Future<Response> getAll({int? limit, int? offset});

  Future<Response> get({required String applicationId});

  Future<Response> delete({required String applicationId});
}
