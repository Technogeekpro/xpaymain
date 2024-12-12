import 'package:get_storage/get_storage.dart';

class StorageService {
  final GetStorage _box;

  StorageService() : _box = GetStorage();

  Future<void> saveValue(String key, dynamic value) async {
    await _box.write(key, value);
  }

  T? getValue<T>(String key) {
    return _box.read<T>(key);
  }

  Future<void> removeValue(String key) async {
    await _box.remove(key);
  }
}
