import 'package:jobs_flutter_app/app/data/remote/base/status.dart';
import 'package:jobs_flutter_app/app/data/remote/base/idto.dart';

abstract class IRepository<T> {
  Future<bool?> create({required IDto dto});

  Future<Status<List<T>>?> getAll({int? limit, int? offset});

  Future<Status<T>> get({required String uuid});

  Future<bool?> update({required String uuid, required IDto dto});

  Future<bool?> delete({required String uuid});
}
