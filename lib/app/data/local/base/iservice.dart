import 'i_entity.dart';

abstract class IService {
  Future<dynamic> read({required String key});

  Future<void> write({required String key, required IEntity entity});

  Future<void> remove({required String key});
}
