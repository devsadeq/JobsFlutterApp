import 'package:dio/dio.dart';

import '../../base/status.dart';
import '../../dto/search/search_out_dto.dart';
import '../../exceptions/dio_exceptions.dart';
import '../../services/search/i_search_service.dart';
import 'i_search_repository.dart';

class SearchRepository extends ISearchRepository<SearchOutDto> {
  final ISearchService service;

  SearchRepository({required this.service});

  @override
  Future<Status<List<SearchOutDto>>> getAll(
      {int? limit, int? offset, String? q}) async {
    try {
      final response = await service.getAll(limit: limit, offset: offset, q: q);
      final results =
          (response.data as List).map((e) => SearchOutDto.fromJson(e)).toList();
      if (response.statusCode == 200) return Status.success(data: results);
      return const Status.failure(reason: "Some thing wrong happen!");
    } on DioError catch (e) {
      final errMsg = DioExceptions.fromDioError(e).toString();
      return Status.failure(reason: errMsg);
    }
  }
}
