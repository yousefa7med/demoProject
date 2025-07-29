
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
              // CostumTextFormField(
              //   prefixIcon: Icons.person,
              //   hintText: 'User Name',
              // ),

              // CostumTextFormField(
              //   prefixIcon: Icons.password,
              //   hintText: 'Password',
              // ),

              // Bottom(text: "Login", color: Color(0xff9C28B2)),
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
