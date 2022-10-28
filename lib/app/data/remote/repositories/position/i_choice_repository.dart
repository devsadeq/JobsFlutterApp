import '../../base/status.dart';

abstract class IChoiceRepository<T> {
  Future<Status<List<T>>> getAll({int? limit, int? offset});
}
