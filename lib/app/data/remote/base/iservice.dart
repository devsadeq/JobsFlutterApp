import 'package:dio/dio.dart';

abstract class IService<T> {
  Future<Response> create({required T dto});

  Future<Response> getAll({int? limit, int? offset});

  Future<Response> get({required String uuid});

  Future<Response> update({required String uuid, required T dto});

  Future<Response> delete({required String uuid});
}
