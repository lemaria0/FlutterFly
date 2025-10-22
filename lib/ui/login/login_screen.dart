import 'package:flutter/material.dart';
import 'package:quiz/ui/login/login_view_model.dart';
import 'package:quiz/utils/results.dart';
import 'package:quiz/utils/show_error_message.dart';
import 'package:quiz/utils/show_ok_message.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.viewModel});

  final LoginViewModel viewModel;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = widget.viewModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Text("login"),
              ElevatedButton(
                onPressed: () async {
                  final result = await viewModel.loginGoogle();
                  switch (result) {
                    case Ok():
                      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                      showOkMessage(context, 'Login bem-sucedido');
                    case Error():
                      showErrorMessage(context, result.errorMessage);
                  }
                },
                child: Text("login com o google"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}