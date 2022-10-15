import 'package:dio/src/response.dart';

import '../../api/api_routes.dart';
import '../../api/dio_client.dart';
import '../../base/idto.dart';
import 'i_application_service.dart';

class ApplicationService implements IApplicationService {
  final DioClient dioClient;

  ApplicationService({required this.dioClient});

  @override
  Future<Response> delete({required String applicationId}) async {
    try {
      return await dioClient.delete("${ApiRoutes.APPLICATIONS}$applicationId");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> get({required String applicationId}) async {
    try {
      return await dioClient.get("${ApiRoutes.APPLICATIONS}$applicationId");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> getAll({int? limit, int? offset}) async {
    try {
      return await dioClient.get(ApiRoutes.APPLICATIONS, queryParameters: {
        "limit": limit ?? 20,
        "offset": offset ?? 0,
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> create({required IDto dto}) async {
    try {
      return await dioClient.post(
        ApiRoutes.JOB_APPLY,
        data: dto.toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }
}
