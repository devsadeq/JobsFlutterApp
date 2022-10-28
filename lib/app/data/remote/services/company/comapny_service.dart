import 'package:dio/src/response.dart';

import '../../api/api_routes.dart';
import '../../api/dio_client.dart';
import 'i_company_service.dart';

class CompanyService implements ICompanyService {
  final DioClient dioClient;

  CompanyService({required this.dioClient});

  @override
  Future<Response> get({required String uuid}) async {
    try {
      return await dioClient.get('${ApiRoutes.COMPANIES}/$uuid');
    } catch (e) {
      rethrow;
    }
  }
}
