import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rajneesh_assignment/utils/validator.dart';
import 'package:rajneesh_assignment/view/screens/home_screen.dart';
import 'package:rajneesh_assignment/view/screens/login_screen.dart';
import 'package:rajneesh_assignment/view/widgets/common_button_widget.dart';
import 'package:rajneesh_assignment/view/widgets/common_text_field.dart';
import 'package:rajneesh_assignment/view/widgets/progress_dialog.dart';
import 'package:rajneesh_assignment/view_model/sign_up_view_model.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RegisterViewModel registerViewModel = Get.put(RegisterViewModel());
    return Scaffold(
      body: Form(
        key: registerViewModel.formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              const SizedBox(height: 35.0),
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Create an account, It\'s free',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black.withOpacity(.5),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 30.0),
              CommonTextField(
                controller: registerViewModel.firstNameController,
                hint: 'First Name',
                validator: (value) {
                  return Validator.validateName('First Name', value!);
                },
              ),
              CommonTextField(
                controller: registerViewModel.lastNameController,
                hint: 'Last Name',
                validator: (value) {
                  return Validator.validateName('Last Name', value!);
                },
              ),
              CommonTextField(
                controller: registerViewModel.emailController,
                hint: 'Email',
                validator: (value) {
                  return Validator.validateEmail(value!);
                },
              ),
              CommonTextField(
                controller: registerViewModel.passwordController,
                hint: 'Password',
                isPassword: true,
                validator: (value) {
                  return Validator.validatePassword(value!);
                },
              ),
              CommonTextField(
                controller: registerViewModel.confirmPasswordController,
                hint: 'Confirm Password',
                isPassword: true,
                validator: (value) {
                  return Validator.validatePassword(value!);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CommonButton(
                onPressed: () {
                  ///Validate the form
                  if (registerViewModel.formKey.currentState!.validate()) {
                    ProgressDialog.showProgressDialog();
                    ///Register the user and navigate to home screen
                    registerViewModel.register().then((value) {
                      ProgressDialog.dismissProgressDialog();
                      Get.to((() => const HomeScreen()));
                    });
                  }
                },
                title: 'SignUp',
              ),
              const SizedBox(
                height: 16,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(
                      color: Colors.black.withOpacity(.5),
                      fontSize: 16.0,
                    ),
                    children: [
                      TextSpan(
                        text: "Login",
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                          ///Navigate to login screen
                            Get.to(() => const LoginScreen());
                          },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
