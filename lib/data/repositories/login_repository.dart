import 'package:flutter/material.dart';

import 'package:quiz/models/user.dart';
import 'package:quiz/utils/results.dart';

import 'package:quiz/data/services/auth_service.dart';
import 'package:quiz/data/services/database_service.dart';
import 'package:quiz/data/services/shared_preferences_service.dart';

abstract class ILoginRepository extends ChangeNotifier {
  Future<Result<void>> loginGoogle();
}

class LoginRepository extends ILoginRepository {
  LoginRepository({
    required AuthService authService,
    required DatabaseService databaseService,
    required SharedPreferencesService preferencesService,
  }) : _authService = authService,
       _databaseService = databaseService,
       _preferencesService = preferencesService;

  final AuthService _authService;
  final DatabaseService _databaseService;
  final SharedPreferencesService _preferencesService;

  @override
  Future<Result<void>> loginGoogle() async {
    try {
      final authResult = await _authService.loginGoogle();
      switch (authResult) {
        case Ok(value: final userCredential):
          final isNewUser = userCredential.additionalUserInfo?.isNewUser ?? false;
          final googleUser = userCredential.user!;
          final userId = googleUser.uid;
          final userName = googleUser.displayName ?? '';
          final userEmail = googleUser.email ?? '';
          final userPhoto = googleUser.photoURL ?? '';

          if (isNewUser) {
            // usuário novo: cria dados no Firestore
            final user = User(
              id: userId,
              name: userName,
              email: userEmail,
              photo: userPhoto,
            );

            final setResult = await _databaseService.setUserData(user: user);
            switch (setResult) {
              case Error(error: final e):
                return Result.error(e);
              case Ok():
                final preferencesResult = await _preferencesService.saveUserData(user: user);
                switch (preferencesResult) {
                  case Ok():
                    return const Result.ok(null);
                  case Error(error: final e):
                    return Result.error(e);
                }
            }
          } else {
            // usuário existente: busca dados no Firestore
            final fetchResult = await _databaseService.fetchUserData(userId: userId);
            switch (fetchResult) {
              case Error(error: final e):
                return Result.error(e);
              case Ok(value: final user):
                final preferencesResult = await _preferencesService.saveUserData(user: user);
                switch (preferencesResult) {
                  case Ok():
                    return const Result.ok(null);
                  case Error(error: final e):
                    return Result.error(e);
                }
            }
          }
        case Error(error: final e):
          return Result.error(e);
      }
    } finally {
      notifyListeners();
    }
  }
}