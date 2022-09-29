import 'package:jobs_flutter_app/app/data/remote/base/state.dart';
import 'package:jobs_flutter_app/app/data/remote/base/idto.dart';

abstract class IRepository<T> {
  Future<bool?> create({required IDto dto});

  Future<State<List<T>>?> getAll({int? limit, int? offset});

  Future<State<T?>> get({required String uuid});

  Future<bool?> update({required String uuid, required IDto dto});

  Future<bool?> delete({required String uuid});
}
