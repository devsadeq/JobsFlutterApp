import 'package:dio/dio.dart';

import '../../../../utils/constants.dart';
import '../../api/dio_client.dart';
import '../../base/idto.dart';
import 'i_job_service.dart';

class JobService implements IJobService {
  final DioClient dioClient;

  JobService({required this.dioClient});

  @override
  Future<Response> get({required String uuid}) async {
    try {
      return await dioClient.get('${ApiRoutes.JOBS}/$uuid');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> getAll({
    int? limit,
    int? offset,
    bool? isFeatured,
    String? position,
    String? companyId,
  }) async {
    try {
      return await dioClient.get(ApiRoutes.JOBS, queryParameters: {
        "limit": limit ?? 20,
        "offset": offset ?? 0,
        if (isFeatured != null) "is_featured": isFeatured,
        if (position != null) "position": position,
        if (companyId != null) "company_id": companyId,
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> delete({required String uuid}) async {
    try {
      return await dioClient.delete('${ApiRoutes.JOBS}/$uuid');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> update({required String uuid, required IDto dto}) async {
    try {
      return await dioClient.put(
        '${ApiRoutes.JOBS}/$uuid',
        data: dto.toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> create({required IDto dto}) async {
    try {
      return await dioClient.post(ApiRoutes.JOBS, data: dto.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
