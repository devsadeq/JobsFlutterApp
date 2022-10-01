import 'package:jobs_flutter_app/app/data/remote/base/idto.dart';

abstract class IAuthRepository<T> {
  Future<T> login({required IDto dto});

  Future<T> registerCompany({required IDto dto});

  Future<T> registerCustomer({required IDto dto});
}
