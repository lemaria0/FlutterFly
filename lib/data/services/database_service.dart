import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:quiz/models/user.dart';

import 'package:quiz/utils/results.dart';

class DatabaseService {

  final FirebaseFirestore _firestore;

  DatabaseService({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<Result<User>> fetchUserData({required String userId}) async {
    try {
      final doc = await _firestore.collection('users').doc(userId).get();
      if (doc.exists) {
        final user = User.fromMap(doc.data()!, doc.id);
        return Result.ok(user);
      } else {
        return Result.error(Exception("Os dados do usuário não foram encontrados"));
      }
    } catch (e) {
      return Result.error(
          Exception("Erro ao acessar os dados do usuário"));
    }
  }

  Future<Result<void>> setUserData({required User user}) async {
    try {
      await _firestore.collection('users').doc(user.id).set(user.toMap());
      return const Result.ok(null);
    } catch (e) {
      return Result.error(
          Exception("Erro ao salvar os dados do usuário"));
    }
  }
}