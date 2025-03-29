import 'package:bookify/features/auth/presentation/views/widgets/forget_password_view_body.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: ForgotPasswordViewBody()),
    );
  }
}
