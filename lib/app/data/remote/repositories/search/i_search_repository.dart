import '../../base/status.dart';

abstract class ISearchRepository<T> {
  Future<Status<List<T>>?> getAll({
    int? limit,
    int? offset,
    String? q,
  });
}
