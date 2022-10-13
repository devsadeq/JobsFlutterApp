import 'package:dio/dio.dart';
import 'package:jobs_flutter_app/app/data/remote/base/iservice.dart';

import 'idto.dart';

abstract class ISearchService<T> implements OldIJobService<IDto> {
  @override
  Future<Response> create({required IDto dto}) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Response> delete({required String uuid}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Response> get({required String uuid}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<Response> getAll({int? limit, int? offset, String? q});

  @override
  Future<Response> update({required String uuid, required IDto dto}) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
