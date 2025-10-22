import 'package:flutter/material.dart';

import 'package:quiz/utils/results.dart';

import 'package:quiz/data/repositories/login_repository.dart';

class LoginViewModel extends ChangeNotifier{

   LoginViewModel({
    required ILoginRepository loginRepository,
  }) :
    _loginRepository = loginRepository;

  final ILoginRepository _loginRepository;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<Result<void>> loginGoogle() async {
    try {
      _isLoading = true;
      notifyListeners();

      final result = await _loginRepository.loginGoogle();

      switch (result) {
        case Ok():
          return const Result.ok(null);
        case Error(error: final e):
          return Result.error(e);
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}