import 'package:dio/dio.dart';

abstract class IChoiceService {
  Future<Response> getAll({int? limit, int? offset, String? q});
}
