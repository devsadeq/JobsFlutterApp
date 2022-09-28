import 'package:jobs_flutter_app/app/data/remote/base/state.dart';
import 'package:jobs_flutter_app/app/data/remote/base/idto.dart';

abstract class IRepository<T> {
  Future<bool?> create({required IDto dto});

  Future<State<List<T>>?> getAllJobs({int? limit, int? offset});

  Future<T?> getJob({required String uuid});

  Future<bool?> updateJob({required String uuid, required IDto dto});

  Future<bool?> deleteJob({required String uuid});
}
