import 'package:dio/dio.dart';

import '../../base/idto.dart';
import '../../base/status.dart';
import '../../dto/job/job_out_dto.dart';
import '../../exceptions/dio_exceptions.dart';
import '../../services/job/i_job_service.dart';
import 'i_job_repository.dart';

class JobRepository implements IJobRepository<JobOutDto> {
  final IJobService service;

  JobRepository({required this.service});

  @override
  Future<bool?> create({required IDto dto}) async {
    try {
      final response = await service.create(dto: dto);
      if (response.statusCode == 200) return true;
      return false;
    } on DioError catch (e) {
      final errMsg = DioExceptions.fromDioError(e).toString();
      throw errMsg;
    }
  }

  @override
  Future<bool?> delete({required String uuid}) async {
    try {
      final response = await service.delete(uuid: uuid);
      if (response.statusCode == 200) return true;
      return false;
    } on DioError catch (e) {
      final errMsg = DioExceptions.fromDioError(e).toString();
      throw errMsg;
    }
  }

  @override
  Future<Status<List<JobOutDto>>> getAll({
    int? limit,
    int? offset,
    bool? isFeatured,
    String? position,
    String? companyId,
  }) async {
    try {
      final response = await service.getAll(
        limit: limit,
        offset: offset,
        isFeatured: isFeatured,
        companyId: companyId,
        position: position,
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
  Future<Status<JobOutDto>> get({required String uuid}) async {
    try {
      final response = await service.get(uuid: uuid);
      if (response.statusCode == 200) {
        final JobOutDto job = JobOutDto.fromJson(response.data);
        return Status.success(data: job);
      }
      return const Status.failure(reason: "Something went wrong!");
    } on DioError catch (e) {
      final errMsg = DioExceptions.fromDioError(e).toString();
      return Status.failure(reason: errMsg);
    }
  }

  @override
  Future<bool?> update({required String uuid, required IDto dto}) async {
    try {
      final response = await service.update(uuid: uuid, dto: dto);
      if (response.statusCode == 200) return true;
      return false;
    } on DioError catch (e) {
      final errMsg = DioExceptions.fromDioError(e).toString();
      throw errMsg;
    }
  }
}
