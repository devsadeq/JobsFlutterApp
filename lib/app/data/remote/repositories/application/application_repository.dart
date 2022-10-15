import 'package:dio/dio.dart';

import '../../base/idto.dart';
import '../../base/status.dart';
import '../../dto/application/application_out_dto.dart';
import '../../exceptions/dio_exceptions.dart';
import '../../services/application/i_application_service.dart';
import 'i_application_repository.dart';

class ApplicationRepository implements IApplicationRepository {
  final IApplicationService service;

  ApplicationRepository({required this.service});

  @override
  Future<Status<bool>> create({required IDto dto}) async {
    try {
      await service.create(dto: dto);
      return const Status.success(data: true);
    } on DioError catch (e) {
      final errMsg = DioExceptions.fromDioError(e).toString();
      return Status.failure(reason: errMsg);
    }
  }

  @override
  Future<Status<bool>> delete({required String applicationId}) async {
    try {
      await service.delete(applicationId: applicationId);
      return const Status.success(data: true);
    } on DioError catch (e) {
      final errMsg = DioExceptions.fromDioError(e).toString();
      return Status.failure(reason: errMsg);
    }
  }

  @override
  Future<Status<ApplicationOutDto>> get({required String applicationId}) async {
    try {
      final response = await service.get(applicationId: applicationId);
      return Status.success(data: ApplicationOutDto.fromJson(response.data));
    } on DioError catch (e) {
      final errMsg = DioExceptions.fromDioError(e).toString();
      return Status.failure(reason: errMsg);
    }
  }

  @override
  Future<Status<List<ApplicationOutDto>>> getAll({
    int? limit,
    int? offset,
  }) async {
    try {
      final response = await service.getAll(limit: limit, offset: offset);
      final applications = (response.data['items'] as List)
          .map((e) => ApplicationOutDto.fromJson(e))
          .toList();
      return Status.success(data: applications);
    } on DioError catch (e) {
      final errMsg = DioExceptions.fromDioError(e).toString();
      return Status.failure(reason: errMsg);
    }
  }
}
