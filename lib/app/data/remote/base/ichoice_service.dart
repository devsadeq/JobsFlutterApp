import 'package:dio/dio.dart';
import 'package:jobs_flutter_app/app/data/remote/base/iservice.dart';

abstract class IChoiceService<T> implements OldIJobService<T> {
  Future<Response> create({required T dto}) {
    // TODO: implement create
    throw UnimplementedError();
  }

  Future<Response> getAll({int? limit, int? offset , String? q});

  Future<Response> get({required String uuid}) {
    // TODO: implement create
    throw UnimplementedError();
  }

  Future<Response> update({required String uuid, required T dto}) {
    // TODO: implement create
    throw UnimplementedError();
  }

  Future<Response> delete({required String uuid}) {
    // TODO: implement create
    throw UnimplementedError();
  }
}
