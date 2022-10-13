import '../../base/idto.dart';
import '../../base/status.dart';

abstract class IJobRepository<T> {
  Future<bool?> create({required IDto dto});

  Future<bool?> delete({required String uuid});

  Future<Status<T>> get({required String uuid});

  Future<Status<List<T>>?> getAll({
    int? limit,
    int? offset,
    bool? isFeatured,
    String? position,
    String? companyId,
  });

  Future<bool?> update({required String uuid, required IDto dto});
}
