import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_first_riverpod/data/constants/route_names.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: TextButton(onPressed: (){
          context.pushNamed(RouteNames.home);
        }, child: Text('Go to Home')),
      ),);
  }
}
