import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starlife_task/core/helper/show_snake_bar.dart';
import 'package:starlife_task/core/helper/spacing.dart';
import 'package:starlife_task/core/helper/validator.dart';
import 'package:starlife_task/core/theme/style.dart';
import 'package:starlife_task/core/widgets/custom_button.dart';
import 'package:starlife_task/core/widgets/custom_text_field.dart';
import 'package:starlife_task/feature/login/data/model/login_request_body.dart';
import 'package:starlife_task/feature/login/presentation/view_model/cubit/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  //clear email and password
  void clearEmailAndPassword() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            AppSnakeBar.showSuccessMessage(context, 'Login successfully');
          } else if (state is LoginError) {
            AppSnakeBar.showErrorMessage(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is LoginSuccess) {
            clearEmailAndPassword();
          }
          final logincubit = context.read<LoginCubit>();
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Login', style: AppTextStyle.font16Bold),
                  verticalSpace(24),
                  CustomTextField(
                    hintText: 'Email',
                    validator: (email) => Validator.isValidEmail(email),
                    controller: emailController,
                  ),
                  verticalSpace(16),
                  CustomTextField(
                    hintText: 'Password',
                    validator: (password) =>
                        Validator.isValidPassword(password),
                    controller: passwordController,
                  ),
                  verticalSpace(16),
                  CustomButton(
                    text: state is LoginLoading ? 'Loading...' : 'Login',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        logincubit.login(
                          loginRequestBody: LoginRequestBody(
                            email: emailController.text,
                            password: passwordController.text,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
