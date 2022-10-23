import 'package:dio/src/response.dart';

abstract class ICustomerService {
  Future<Response> toggleSave({
    required String customerUuid,
    required String jobUuid,
  });

  Future<Response> getAllSavedJobs({
    int? limit,
    int? offset,
    required String customerUuid,
  });

  Future<Response> getProfile({
    required String customerUuid,
  });

}
