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
      return await dioClient.get('${AppConstants.JOBS_ROUTE}/$uuid');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> getAll({int? limit, int? offset}) async {
    try {
      return await dioClient.get(AppConstants.JOBS_ROUTE, queryParameters: {
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
      return await dioClient.delete('${AppConstants.JOBS_ROUTE}/$uuid');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> update({required String uuid, required IDto dto}) async {
    try {
      return await dioClient.put(
        '${AppConstants.JOBS_ROUTE}/$uuid',
        data: dto.toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> create({required IDto dto}) async {
    try {
      return await dioClient.post(AppConstants.JOBS_ROUTE, data: dto.toJson());
    } catch (e) {
      rethrow;
    }
  }
}