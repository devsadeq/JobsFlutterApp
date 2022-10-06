import 'package:dio/src/response.dart';

import '../../../../utils/constants.dart';
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
      return await dioClient.post(ApiRoutes.SAVED_JOBS, queryParameters: {
        "limit": limit ?? 20,
        "offset": offset ?? 0,
        "customer_id ": customerUuid,
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> saveJob({
    required String customerUuid,
    required String jobUuid,
  }) async {
    try {
      return await dioClient
          .post("${ApiRoutes.CUSTOMERS}/$customerUuid/$jobUuid");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> unSaveJob({
    required String customerUuid,
    required String jobUuid,
  }) async {
    try {
      return await dioClient
          .delete("${ApiRoutes.CUSTOMERS}/$customerUuid/$jobUuid");
    } catch (e) {
      rethrow;
    }
  }
}
