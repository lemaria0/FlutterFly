import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:quiz/data/repositories/login_repository.dart';
import 'package:quiz/ui/home/home_screen.dart';
import 'package:quiz/ui/login/login_screen.dart';
import 'package:quiz/ui/login/login_view_model.dart';

// Routes
import 'package:quiz/config/routes.dart';

// Services
import 'package:quiz/data/services/auth_service.dart';
import 'package:quiz/data/services/database_service.dart';
import 'package:quiz/data/services/shared_preferences_service.dart';
import 'package:quiz/ui/quiz/quiz_screen.dart';
import 'package:quiz/ui/ranking/ranking_screen.dart';
import 'package:quiz/ui/ranking/ranking_screen_empty.dart';
import 'package:quiz/ui/ranking/ranking_screen_result.dart';

// Repositories
//import 'package:quiz/data/repositories/login_repository.dart';
//import 'package:quiz/data/repositories/sign_up_repository.dart';
//import 'package:quiz/data/repositories/quiz_repository.dart';

// First Page - Splash Page
//import 'package:quiz/ui/home/view/splash_page.dart';
//import 'package:quiz/ui/home/view_model/splash_page_viewmodel.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => AuthService()),
        Provider(create: (context) => DatabaseService()),
        Provider(create: (context) => SharedPreferencesService()),
        ChangeNotifierProvider(
          create: (context) => LoginRepository(
            authService: context.read(),
            databaseService: context.read(),
            preferencesService: context.read(),
          ),
        ),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            theme: ThemeData(
              textTheme: GoogleFonts.robotoTextTheme(
                Theme.of(context).textTheme,
              ),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            home: RankingScreenResult(),
            routes: appRoutes,
          );
        },
      ),
    );
  }
}
