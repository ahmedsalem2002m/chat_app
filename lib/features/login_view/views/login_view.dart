import 'package:chat_app/core/utils/app_colors.dart';
import 'package:chat_app/features/login_view/views/widgets/custom_button.dart';
import 'package:chat_app/features/login_view/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../register_view/views/register_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static String id = "LoginView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 44,),
              Image.asset("assets/images/scholar.png"),
              Text(
                "Scholar Chat",
                style: TextStyle(
                  fontFamily: "pacifico",
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 52,),
              Row(
                children: [
                  Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              CustomTextField(textHint: "Email"),
              SizedBox(height: 8),
              CustomTextField(textHint: "Password"),
              SizedBox(height: 16),
              CustomButton(title: "Sign In",),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RegisterView.id);
                    },
                    child: Text(
                      " Register",
                      style: TextStyle(
                          color: AppColors.kRowTextColor
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
