import 'package:my_first_riverpod/auth/presentation/pages/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:my_first_riverpod/core/theming/custom_theme.dart';

class AppWidget2 extends StatelessWidget {
  const AppWidget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.appTheme,
      home: const SignInPage(),
    );
  }
}
