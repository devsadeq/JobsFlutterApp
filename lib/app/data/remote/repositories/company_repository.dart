import 'package:dio/dio.dart';
import 'package:jobs_flutter_app/app/data/remote/base/idto.dart';
import 'package:jobs_flutter_app/app/data/remote/base/irepository.dart';
import 'package:jobs_flutter_app/app/data/remote/base/status.dart';
import 'package:jobs_flutter_app/app/data/remote/dto/company/Company_out_dto.dart';

import '../base/iservice.dart';
import '../exceptions/dio_exceptions.dart';

class CompanyRepository implements IRepository<CompanyOutDto> {
  final IService service;

  CompanyRepository({required this.service});

  @override
  Future<bool?> create({required IDto dto}) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<bool?> delete({required String uuid}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Status<CompanyOutDto>> get({required String uuid}) async {
    try {
      final response = await service.get(uuid: uuid);
      if (response.statusCode == 200) {
        final CompanyOutDto job = CompanyOutDto.fromJson(response.data);
        return Status.success(data: job);
      }
      return const Status.failure(reason: "Something went wrong!");
    } on DioError catch (e) {
      final errMsg = DioExceptions.fromDioError(e).toString();
      return Status.failure(reason: errMsg);
    }
  }

  @override
  Future<Status<List<CompanyOutDto>>?> getAll({int? limit, int? offset}) {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<bool?> update({required String uuid, required IDto dto}) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
