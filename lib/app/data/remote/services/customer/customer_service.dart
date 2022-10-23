import 'package:dio/src/response.dart';

import '../../api/api_routes.dart';
import '../../api/dio_client.dart';
import 'i_customer_service.dart';

class CustomerService implements ICustomerService {
  final DioClient dioClient;

  CustomerService({required this.dioClient});

  @override
  Future<Response> getAllSavedJobs({
    int? limit,
    int? offset,
    required String customerUuid,
  }) async {
    try {
      return await dioClient.get(ApiRoutes.SAVED_JOBS, queryParameters: {
        "limit": limit ?? 20,
        "offset": offset ?? 0,
        "customer_id": customerUuid,
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> toggleSave({
    required String customerUuid,
    required String jobUuid,
  }) async {
    try {
      return await dioClient.post(
        ApiRoutes.TOGGLE_SAVE,
        queryParameters: {
          'customer_id': customerUuid,
          'job_id': jobUuid,
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> getProfile({required String customerUuid}) async {
    try {
      return await dioClient.get("${ApiRoutes.CUSTOMERS}/$customerUuid");
    } catch (e) {
      rethrow;
    }
  }
}
