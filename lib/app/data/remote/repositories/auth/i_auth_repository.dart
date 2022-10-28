import 'package:jobs_flutter_app/app/data/remote/base/idto.dart';

import '../../../local/base/i_entity.dart';

abstract class IAuthRepository<T> {
  Future<T> login({required IDto dto});

  Future<T> registerCompany({required IDto dto});

  Future<T> registerCustomer({required IDto dto});

  Future<T> readStorage({required String key});

  Future<T> writeStorage({required String key, required IEntity entity});

  Future<T> removeStorage({required String key});
}
