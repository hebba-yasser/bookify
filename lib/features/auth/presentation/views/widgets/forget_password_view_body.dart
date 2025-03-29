import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../../../../../core/Views/widgets/custom_button.dart';
import '../../../../../core/Views/widgets/custom_text_form_field.dart';
import '../../../../../core/Views/widgets/header_desc_text.dart';
import '../../../../../core/styles/fonts.dart';
import '../../../../../core/utils/functions/custom_loading_indicator.dart';
import '../../../../../core/views/widgets/custom_back_button.dart';

class ForgotPasswordViewBody extends StatefulWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  State<ForgotPasswordViewBody> createState() => _ForgotPasswordViewBodyState();
}

class _ForgotPasswordViewBodyState extends State<ForgotPasswordViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.2),
              children: [
                const Center(
                  child: HeaderDescText(
                    title: 'Forgot Password',
                    subTitle:
                        'Enter your email address associated with your account and we will send you instructions to reset your password',
                  ),
                ),
                const SizedBox(height: 40),
                Text('Email address', style: AppFonts.bodyText18),
                CustomTextFormField(
                  controller: emailController,
                  keyboardText: TextInputType.emailAddress,
                  hintText: 'Email',
                  prefixIcon: Icons.email,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                ConditionalBuilder(
                  condition: true,
                  builder: (context) => CustomButton(
                    height: 50,
                    text: 'Reset Password',
                    onPressed: () {},
                  ),
                  fallback: (context) => customLoadingIndicator(),
                ),
              ],
            ),
          ),
        ),
        // Custom Back Button at the top
        const Positioned(
          top: 30,
          left: 12,
          child: CustomBackButton(),
        ),
      ],
    );
  }
}
