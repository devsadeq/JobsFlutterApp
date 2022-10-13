import 'package:dio/src/response.dart';

import '../../base/idto.dart';

abstract class IJobService {
  Future<Response> create({required IDto dto});

  Future<Response> delete({required String uuid});

  Future<Response> get({required String uuid});

  Future<Response> getAll({
    int? limit,
    int? offset,
    bool? isFeatured,
    String? position,
    String? companyId,
  });

  Future<Response> update({required String uuid, required IDto dto});
}
