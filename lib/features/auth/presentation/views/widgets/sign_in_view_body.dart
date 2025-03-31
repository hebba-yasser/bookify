import 'package:bookify/features/auth/presentation/views/widgets/text_button_sign_up.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/cubits/user_data_cubit/user_data_cubit.dart';
import '../../../../../core/cubits/user_data_cubit/user_data_state.dart';
import '../../../../../core/styles/fonts.dart';
import '../../../../../core/utils/cache_helper.dart';
import '../../../../../core/utils/functions/Navigaor_push.dart';
import '../../../../../core/utils/functions/custom_loading_indicator.dart';
import '../../../../../core/utils/functions/custom_show_toast.dart';
import '../../../../../core/views/widgets/custom_button.dart';
import '../../../../../core/views/widgets/custom_text_button.dart';
import '../../../../../core/views/widgets/custom_text_form_field.dart';
import '../../../../../core/views/widgets/header_desc_text.dart';
import '../../../../home/presentation/views/home_view.dart';
import '../../manager/Auth_cubit/auth_cubit.dart';
import '../forget_password.dart';

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
    return BlocListener<UserDataCubit, UserDataState>(
      listener: (context, userState) {
        if (userState is UserDataSuccess) {
          return navigatorPush(context, const HomeView());
        }
      },
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoginSuccess) {
            uId = CacheHelper.getString(key: 'uid');
            context.read<UserDataCubit>().fetchUserData(id: uId ?? '');
          }
          if (state is AuthLoginFailure) {
            customShowToast(state.errMess);
          }
        },
        builder: (context, state) {
          var cubit = BlocProvider.of<AuthCubit>(context);

          return Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ListView(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.2),
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
                    suffixIcon: cubit.suffixIcon,
                    suffixOnPressed: () {
                      cubit.togglePasswordVisibility();
                    },
                    obscureText: cubit.isHidden,
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
                    condition: state is! AuthLoginLoading,
                    builder: (context) => CustomButton(
                      text: 'Sign In',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          cubit.login(
                              email: emailController.text,
                              password: passwordController.text);
                        }
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
        },
      ),
    );
  }
}
