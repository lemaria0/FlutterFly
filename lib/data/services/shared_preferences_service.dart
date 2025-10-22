import 'package:shared_preferences/shared_preferences.dart';

import 'package:quiz/models/user.dart';
import 'package:quiz/utils/results.dart';

class SharedPreferencesService {
  static const _keyId = 'userId';
  static const _keyName = 'userName';
  static const _keyPhoto = 'userPhoto';
  static const _keyEmail = 'userEmail';

  final Future<SharedPreferences> _preferences;

  SharedPreferencesService({Future<SharedPreferences>? preferences})
      : _preferences = preferences ?? SharedPreferences.getInstance();

  Future<Result<void>> saveUserData({required User user}) async {
    final preferences = await _preferences;

    try {
      await preferences.setString(_keyId, user.id);
      await preferences.setString(_keyName, user.name);
      await preferences.setString(_keyPhoto, user.photo);
      await preferences.setString(_keyEmail, user.email);

      return const Result.ok(null);
    } catch (e) {
      return Result.error(Exception("Erro ao salvar os dados localmente"));
    }
  }

  Future<Result<User>> getUserData() async {
    try {
      final preferences = await _preferences;

      final id = preferences.getString(_keyId);
      final name = preferences.getString(_keyName);
      final photo = preferences.getString(_keyPhoto);
      final email = preferences.getString(_keyEmail);

      final User user = User(
        id: id ?? '',
        name: name ?? '',
        photo: photo ?? '',
        email: email ?? '',
      );

      return Result.ok(user);
    } catch (e) {
      return Result.error(Exception("Erro ao acessar os dados localmente"));
    }
  }

  Future<Result<void>> clearData() async {
    try {
      final preferences = await _preferences;
      await preferences.clear();
      return const Result.ok(null);
    } catch (e) {
      return Result.error(Exception("Erro ao limpar os dados localmente"));
    }
  }
}