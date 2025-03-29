import 'package:bookify/features/auth/presentation/views/widgets/text_button_sign_up.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../../../../../core/styles/fonts.dart';
import '../../../../../core/utils/functions/Navigaor_push.dart';
import '../../../../../core/utils/functions/custom_loading_indicator.dart';
import '../../../../../core/views/widgets/custom_button.dart';
import '../../../../../core/views/widgets/custom_text_button.dart';
import '../../../../../core/views/widgets/custom_text_form_field.dart';
import '../../../../../core/views/widgets/header_desc_text.dart';
import '../forget_password.dart';
import '../preferences_view.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({Key? key}) : super(key: key);

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
          children: [
            const Center(
                child: HeaderDescText(
              title: 'Sign IN',
              subTitle: 'Hi! Welcome back, you \'ve been missed',
            )),
            const SizedBox(
              height: 40,
            ),
            Text('Email', style: AppFonts.bodyText18),
            CustomTextFormField(
                controller: emailController,
                hintText: 'Email',
                prefixIcon: Icons.email,
                keyboardText: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'email is required';
                  }
                  return null;
                }),
            const SizedBox(
              height: 20,
            ),
            Text('Password', style: AppFonts.bodyText18),
            CustomTextFormField(
              controller: passwordController,
              hintText: 'Password',
              prefixIcon: Icons.lock,
              keyboardText: TextInputType.visiblePassword,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Password is required';
                }
                return null;
              },
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: CustomTextButton(
                text: 'Forgot password?',
                onPressed: () {
                  navigatorPush(context, const ForgotPasswordView());
                },
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ConditionalBuilder(
              condition: true,
              builder: (context) => CustomButton(
                text: 'Sign In',
                onPressed: () {
                  navigatorPush(context, SignUpPreferencesView());
                },
              ),
              fallback: (context) => customLoadingIndicator(),
            ),
            const SizedBox(
              height: 15,
            ),
            const TextButtonSignUp(),
          ],
        ),
      ),
    );
  }
}
