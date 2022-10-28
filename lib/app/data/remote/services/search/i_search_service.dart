import 'package:dio/dio.dart';

abstract class ISearchService {
  Future<Response> getAll({int? limit, int? offset, String? q});
}
