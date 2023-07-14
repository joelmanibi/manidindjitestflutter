import 'package:get_storage/get_storage.dart';

mixin CacheManager {
  Future<bool> saveData(String? firstname,String? lastname,String? phone,String? token) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.TOKEN.toString(), token);
    await box.write(CacheManagerKey.FIRSTNAME.toString(), firstname);
    await box.write(CacheManagerKey.LASTNAME.toString(), lastname);
    await box.write(CacheManagerKey.PHONE.toString(), phone);
    return true;
  }

  String? getToken() {
    final box = GetStorage();
    return box.read(CacheManagerKey.TOKEN.toString());
  }

  String? getFirstname() {
    final box = GetStorage();
    return box.read(CacheManagerKey.FIRSTNAME.toString());
  }

  String? getLastname() {
    final box = GetStorage();
    return box.read(CacheManagerKey.LASTNAME.toString());
  }
  String? getPhone() {
    final box = GetStorage();
    return box.read(CacheManagerKey.PHONE.toString());
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.TOKEN.toString());
    await box.remove(CacheManagerKey.FIRSTNAME.toString());
    await box.remove(CacheManagerKey.LASTNAME.toString());
    await box.remove(CacheManagerKey.PHONE.toString());
  }
}

enum CacheManagerKey { TOKEN,FIRSTNAME,LASTNAME,PHONE }
