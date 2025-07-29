
import 'package:demo_iti/Widgets/bottom.dart';

import 'package:demo_iti/Widgets/signup_form.dart';
import 'package:demo_iti/cubits/signup_cubit/signup_cubit.dart';
import 'package:demo_iti/helper/snackbar_func.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});
  static const signupPageRoute = "rigisterPageRoute";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign Up',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
              Gap(30),
              Text("Create An Account", style: TextStyle(fontSize: 16)),
              Gap(20),
              BlocListener<SignupCubit, SignupState>(
                listener: (context, state) {
                  if (state is SignupLoading) {
                    showSnackBar(context, 'Please Verify Your Account');
                  } else if (state is SignupFailure) {
                    showSnackBar(context, state.errMsg);
                  }
                },
                child: SignupForm(),
              ),
              Gap(10),
              Text(
                'Or',
                style: TextStyle(color: Color(0xff877986), fontSize: 18),
              ),
              Gap(10),

              Bottom(
                text: "Sign In With Google",
                textColor: Color(0xff9C28B2),
                border: Border.all(color: Color(0xff9C28B2), width: 2),
                onTap: () {},
              ),
              Gap(40),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already Have An Account ? "),

                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: Color(0xff9C28B2),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
