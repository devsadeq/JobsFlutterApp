import 'package:dio/src/response.dart';

import '../../api/api_routes.dart';
import '../../api/dio_client.dart';
import 'i_search_service.dart';

class SearchService extends ISearchService {
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
