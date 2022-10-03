import 'package:jobs_flutter_app/app/data/remote/base/irepository.dart';
import 'package:jobs_flutter_app/app/data/remote/base/status.dart';

import 'idto.dart';

abstract class IChoiceRepository<T> implements IRepository<T> {
  @override
  Future<Status<List<T>>> getAll({int? limit, int? offset});

  @override
  Future<bool?> create({required IDto dto}) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<bool?> delete({required String uuid}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Status<T>> get({required String uuid}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<Status<List<T>>?> getAllChoices({int? limit, int? offset}) {
    // TODO: implement getAllChoices
    throw UnimplementedError();
  }

  @override
  Future<bool?> update({required String uuid, required IDto dto}) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
