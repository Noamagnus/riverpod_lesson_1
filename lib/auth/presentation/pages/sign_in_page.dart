import 'package:my_first_riverpod/auth/presentation/widgets/bottom_text_link.dart';
import 'package:my_first_riverpod/auth/presentation/widgets/google_sign_in_button.dart';
import 'package:my_first_riverpod/auth/presentation/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:my_first_riverpod/core/widgets/logo_image.dart';
import 'package:my_first_riverpod/utils/dimensions.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LogoImage(),
                  SizedBox(height: Dimensions.height30),
                  Text(
                    'Sign In',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(height: Dimensions.height40),
                  const SignInForm(),
                  const GoogleSignInButton(),
                  SizedBox(height: Dimensions.height5),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot your password?',
                    ),
                  ),
                  BottomTextLink(
                    text: 'Don\'t have an account?',
                    link: 'Create one now.',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
