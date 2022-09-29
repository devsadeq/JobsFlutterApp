import 'package:jobs_flutter_app/app/data/remote/base/idto.dart';
import 'package:jobs_flutter_app/app/data/remote/base/irepository.dart';
import 'package:jobs_flutter_app/app/data/remote/base/state.dart';

abstract class ISearchRepository<T> implements IRepository<T> {
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
  Future<State<T?>> get({required String uuid}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<bool?> update({required String uuid, required IDto dto}) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
