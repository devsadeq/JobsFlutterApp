import 'package:dio/src/response.dart';

import '../api/api_routes.dart';
import '../api/dio_client.dart';
import '../base/idto.dart';
import '../base/iservice.dart';

class CompanyService implements OldIJobService<IDto> {
  final DioClient dioClient;

  CompanyService({required this.dioClient});

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
  Future<Response> get({required String uuid}) async {
    try {
      return await dioClient.get('${ApiRoutes.COMPANIES}/$uuid');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> getAll({int? limit, int? offset, String? q}) {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<Response> update({required String uuid, required IDto dto}) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
