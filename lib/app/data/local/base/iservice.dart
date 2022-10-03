abstract class IService {
  Future<dynamic> read({required String key});

  Future<void> write({required String key, dynamic value});

  Future<void> remove({required String key});
}
