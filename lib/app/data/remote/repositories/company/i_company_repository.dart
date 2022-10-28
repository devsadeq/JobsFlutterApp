import '../../base/status.dart';

abstract class ICompanyRepository<T> {
  Future<Status<T>> get({required String uuid});
}
