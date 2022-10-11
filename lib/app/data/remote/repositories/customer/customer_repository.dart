import 'package:dio/dio.dart';

import '../../base/status.dart';
import '../../dto/customer/toggle_save_out_dto.dart';
import '../../dto/job/job_out_dto.dart';
import '../../exceptions/dio_exceptions.dart';
import '../../services/customer/i_customer_service.dart';
import 'i_customer_repository.dart';

class CustomerRepository implements ICustomerRepository {
  final ICustomerService service;

  CustomerRepository({required this.service});

  @override
  Future<Status<List<JobOutDto>>> getAllSavedJobs({
    int? limit,
    int? offset,
    required String customerUuid,
  }) async {
    try {
      final response = await service.getAllSavedJobs(
        limit: limit,
        offset: offset,
        customerUuid: customerUuid,
      );
      final jobs = (response.data['items'] as List)
          .map((e) => JobOutDto.fromJson(e))
          .toList();
      if (response.statusCode == 200) return Status.success(data: jobs);
      return const Status.failure(reason: "Some thing wrong happen!");
    } on DioError catch (e) {
      final errMsg = DioExceptions.fromDioError(e).toString();
      return Status.failure(reason: errMsg);
    }
  }

  @override
  Future<Status<ToggleSaveOutDto>> toggleSave({
    required String customerUuid,
    required String jobUuid,
  }) async {
    try {
      final response = await service.toggleSave(
        customerUuid: customerUuid,
        jobUuid: jobUuid,
      );
      if (response.statusCode == 200) {
        return Status.success(data: ToggleSaveOutDto.fromJson(response.data));
      }
      return const Status.failure(reason: "Some thing wrong happen!");
    } on DioError catch (e) {
      final errMsg = DioExceptions.fromDioError(e).toString();
      return Status.failure(reason: errMsg);
    }
  }
}
