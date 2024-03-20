import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/presentation/controllers/auth/sign_in/sign_in_binding.dart';
import 'app/presentation/route/app_route.dart';
import 'app/presentation/screens/auth/sign_in/sign_in_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: AppRoute.pages,
      home: const SignInScreen(),
      initialBinding: SignInBinding(),
    );
  }
}