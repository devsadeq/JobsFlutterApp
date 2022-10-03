import 'package:get_storage/get_storage.dart';
import 'package:jobs_flutter_app/app/data/local/base/iservice.dart';

class StorageService implements IService {
  final GetStorage _storage;

  StorageService(this._storage);

  @override
  Future<dynamic> read({required String key}) async {
    try {
      return await _storage.read(key);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> write({required String key, value}) async {
    try {
      await _storage.write(key, value);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> remove({required String key}) async {
    try {
      await _storage.remove(key);
    } catch (e) {
      rethrow;
    }
  }
}
