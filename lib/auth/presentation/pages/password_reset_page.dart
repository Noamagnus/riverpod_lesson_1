import 'package:my_first_riverpod/auth/presentation/widgets/password_reset_form.dart';
import 'package:flutter/material.dart';
import 'package:my_first_riverpod/core/widgets/logo_image.dart';

class PasswordResetPage extends StatelessWidget {
  const PasswordResetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LogoImage(),
                  const SizedBox(height: 20),
                  Text(
                    'Reset Your Password',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const PasswordResetForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
