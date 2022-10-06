import 'package:dio/src/response.dart';

abstract class ICustomerService {
  Future<Response> saveJob({
    required String customerUuid,
    required String jobUuid,
  });

  Future<Response> unSaveJob({
    required String customerUuid,
    required String jobUuid,
  });

  Future<Response> getAllSavedJobs({
    int? limit,
    int? offset,
    required String customerUuid,
  });
}
