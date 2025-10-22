import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

// Pages
import 'package:quiz/ui/home/home_screen.dart';

// View Models

// Repositories

Map<String, Widget Function(BuildContext)> appRoutes = {
  '/home': (context) => HomeScreen(),
};