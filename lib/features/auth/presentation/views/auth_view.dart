import 'package:bookify/features/auth/presentation/views/widgets/auth_view_body.dart';
import 'package:flutter/material.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: AuthViewBody()),
    );
  }
}
