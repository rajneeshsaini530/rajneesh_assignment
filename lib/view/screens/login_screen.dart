import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rajneesh_assignment/utils/validator.dart';
import 'package:rajneesh_assignment/view/screens/home_screen.dart';
import 'package:rajneesh_assignment/view/screens/register_screen.dart';
import 'package:rajneesh_assignment/view/widgets/common_button_widget.dart';
import 'package:rajneesh_assignment/view/widgets/common_text_field.dart';
import 'package:rajneesh_assignment/view/widgets/progress_dialog.dart';
import 'package:rajneesh_assignment/view_model/login_view_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginViewModel loginViewModel = Get.put(LoginViewModel());
    return Scaffold(
      body: Form(
        key: loginViewModel.formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Please login to continue',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black.withOpacity(.5),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 50.0),
              CommonTextField(
                controller: loginViewModel.emailController,
                hint: 'Email',
                validator: (value) {
                  return Validator.validateEmail(value!);
                },
              ),
              CommonTextField(
                controller: loginViewModel.passwordController,
                hint: 'Password',
                isPassword: true,
                validator: (value) {
                  return Validator.validatePassword(value!);
                },
              ),
              const SizedBox(height: 40.0),
              CommonButton(
                onPressed: () {
                  ///Validate the form
                  if (loginViewModel.formKey.currentState!.validate()) {
                    ProgressDialog.showProgressDialog();

                    ///Login the user and navigate to home screen
                    loginViewModel.login().then((value) {
                      ProgressDialog.dismissProgressDialog();
                      Get.to((() => const HomeScreen()));
                    });
                  }
                },
                title: 'Login',
              ),
              const SizedBox(
                height: 16,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                    children: [
                      TextSpan(
                        text: "Register",
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            ///Navigate to register screen
                            Get.to(() => const RegisterScreen());
                          },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
