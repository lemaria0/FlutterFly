import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz/ui/login/login_view_model.dart';

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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                Image.asset('assets/logo/flutter-fly-logo.png', height: 80),
                Text(
                  'FlutterFly',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF242424),
                    letterSpacing: -1,
                  ),
                ),

                const SizedBox(height: 50),

                Text(
                  'Bem-vindo(a) ao FlutterFly!',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF000000),
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 4),

                Text(
                  'Prepare-se para decolar no mundo do Flutter.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 48),

                SvgPicture.asset(
                  'assets/images/illustration.svg',
                  height: 240,
                  fit: BoxFit.fill,
                ),

                const SizedBox(height: 60),

                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFF02539A),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(color: Color(0xFF02539A), offset: Offset(0, 4)),
                    ],
                  ),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      print('Está funcionando');
                    },
                    icon: SvgPicture.asset('assets/logo/google.svg'),
                    label: Text(
                      'Continuar com Google',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3BBEEE),
                      padding: const EdgeInsets.symmetric(vertical: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                      shadowColor: Color(0xFF02539A),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
