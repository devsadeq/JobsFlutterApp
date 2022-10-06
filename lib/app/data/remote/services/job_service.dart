import 'package:dio/dio.dart';
import 'package:jobs_flutter_app/app/data/remote/base/iservice.dart';
import '../../../utils/constants.dart';
import '../api/dio_client.dart';

import '../base/idto.dart';

class JobService extends IService<IDto> {
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
  Future<Response> getAll({int? limit, int? offset, String? q}) async {
    try {
      return await dioClient.get(ApiRoutes.JOBS, queryParameters: {
        "limit": limit ?? 20,
        "offset": offset ?? 0,
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
