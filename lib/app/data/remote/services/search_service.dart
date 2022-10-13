import 'package:dio/src/response.dart';
import 'package:jobs_flutter_app/app/data/remote/base/idto.dart';

import '../api/api_routes.dart';
import '../api/dio_client.dart';
import '../base/isearch_service.dart';

class SearchService extends ISearchService<IDto> {
  final DioClient dioClient;

  SearchService({required this.dioClient});

  @override
  Future<Response> getAll({int? limit, int? offset, String? q}) async {
    try {
      return await dioClient.get(
        ApiRoutes.SEARCH,
        queryParameters: {
          "company_name": q,
        },
      );
    } catch (e) {
      rethrow;
    }
  }
}
