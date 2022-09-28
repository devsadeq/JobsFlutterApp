import 'package:dio/dio.dart';
import 'package:jobs_flutter_app/app/data/remote/exceptions/dio_exceptions.dart';
import 'package:jobs_flutter_app/app/data/remote/base/state.dart';
import 'package:jobs_flutter_app/app/data/remote/base/idto.dart';
import 'package:jobs_flutter_app/app/data/remote/dto/job/job_out_dto.dart';
import 'package:jobs_flutter_app/app/data/remote/base/irepository.dart';
import 'package:jobs_flutter_app/app/data/remote/base/iservice.dart';

class JobRepository implements IRepository<JobOutDto> {
  final IService service;

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
  Future<bool?> deleteJob({required String uuid}) async {
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
  Future<State<List<JobOutDto>>> getAllJobs({int? limit, int? offset}) async {
    try {
      final response = await service.getAll(limit: limit, offset: offset);
      final jobs = (response.data['items'] as List)
          .map((e) => JobOutDto.fromJson(e))
          .toList();
      if (response.statusCode == 200) return State.success(data: jobs);
      return const State.failure(reason: "Some thing wrong happen!");
    } on DioError catch (e) {
      final errMsg = DioExceptions.fromDioError(e).toString();
      return State.failure(reason: errMsg);
    }
  }

  @override
  Future<JobOutDto?> getJob({required String uuid}) async {
    try {
      final response = await service.get(uuid: uuid);
      return JobOutDto.fromJson(response.data);
    } on DioError catch (e) {
      final errMsg = DioExceptions.fromDioError(e).toString();
      throw errMsg;
    }
  }

  @override
  Future<bool?> updateJob({required String uuid, required IDto dto}) async {
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
