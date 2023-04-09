import 'package:flutter/material.dart';
import 'package:user_list/controller/user_provider.dart';
import 'constants/constants.dart';
import 'screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Details',
      theme: ThemeData(
        scaffoldBackgroundColor: kWhiteBGColor,
      ),
      home: const SplashScreen(),
    );
  }
}
