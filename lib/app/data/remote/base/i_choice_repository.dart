import 'package:jobs_flutter_app/app/data/remote/base/irepository.dart';
import 'package:jobs_flutter_app/app/data/remote/base/state.dart';

import 'idto.dart';

abstract class IChoiceRepository<T> implements IRepository<T> {
  @override
  Future<State<List<T>>> getAll({int? limit, int? offset});

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
  Future<State<T>> get({required String uuid}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<State<List<T>>?> getAllChoices({int? limit, int? offset}) {
    // TODO: implement getAllChoices
    throw UnimplementedError();
  }

  @override
  Future<bool?> update({required String uuid, required IDto dto}) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
