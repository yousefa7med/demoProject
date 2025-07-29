import 'package:demo_iti/Widgets/bottom.dart';
import 'package:demo_iti/Widgets/costum_text_field.dart';
import 'package:demo_iti/cubits/signup_cubit/signup_cubit.dart';
import 'package:demo_iti/helper/validator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignupPage extends StatelessWidget {
   SignupPage({super.key});
  static const signupPageRoute = "rigisterPageRoute";
final GlobalKey formKey=GlobalKey();
final  validator=Validator();
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
              Form(
                key:formKey ,
                child: Column(
                  children: [
                    CostumTextField(hintText: 'Name', prefixIcon: Icons.person, controller: SignupCubit.get(context).userNameController, validator:validator.nameValidator(),),
                    CostumTextField(hintText: 'Email', prefixIcon: Icons.email, controller:  SignupCubit.get(context).emailController, validator:validator.,),
                    CostumTextField(hintText: 'Password', prefixIcon: Icons.password, controller:  SignupCubit.get(context).passwordController, validator:validator.,),
                    CostumTextField(
                      hintText: "Confirm Password",
                      prefixIcon: Icons.password, controller:  SignupCubit.get(context).confirmPasswordController, validator:validator.,
                    ),
                    Bottom(text: 'Sign Up', color: Color(0xff9C28B2)),
                  ],
                ),
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
                onTap:() {
                  
                },
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
