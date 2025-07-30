import 'package:demo_iti/Widgets/bottom.dart';
import 'package:demo_iti/Widgets/app_text_field.dart';
import 'package:demo_iti/Widgets/password_text_field.dart';
import 'package:demo_iti/cubits/login_cubit/login_cubit.dart';
import 'package:demo_iti/helper/validator.dart';
import 'package:demo_iti/views/signup_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const loginPageRoute = "loginPageRoute";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),

              Text(
                'Welcome Back',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
              Text(
                "Enter Your Credential To Login",
                style: TextStyle(fontSize: 16),
              ),
              Spacer(),
              AppTextFormField(
                prefixIcon: Icons.email,
                hintText: 'Email',
                controller: LoginCubit.get(context).emailController,
                validator: Validator.emailValidator(),
              ),

              PasswordTextFormField(
                prefixIcon: Icons.password,
                hintText: 'Password',
                controller: LoginCubit.get(context).passwordController,
                validator: Validator.loginPasswordValidator(),
              ),

              Bottom(text: "Login", color: Color(0xff9C28B2), onTap: () {}),
              Spacer(),

              Text(
                "Forgot Password ?",
                style: TextStyle(
                  color: Color(0xff9C28B2),
                  fontWeight: FontWeight.w800,
                ),
              ),
              Spacer(),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't Have An Account ? "),

                  GestureDetector(
                    onTap:
                        () => Navigator.pushNamed(
                          context,
                          SignupPage.signupPageRoute,
                        ),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color(0xff9C28B2),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
