import 'package:chat_app/core/utils/app_colors.dart';
import 'package:chat_app/features/login_view/views/login_view.dart';
import 'package:chat_app/features/login_view/views/widgets/custom_button.dart';
import 'package:chat_app/features/login_view/views/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  static String id = "RegisterView";

  String? email;
  String? name;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2B475E),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 44),
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
              SizedBox(height: 52),
              Row(
                children: [
                  Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              CustomTextField(
                onChanged: (data) {
                  name = data;
                },
                textHint: "Name",
              ),
              SizedBox(height: 8),
              CustomTextField(
                onChanged: (data) {
                  email = data;
                },
                textHint: "Email",
              ),
              SizedBox(height: 8),
              CustomTextField(
                onChanged: (data) {
                  password = data;
                },
                textHint: "Password",
              ),
              SizedBox(height: 16),
              CustomButton(
                onTap: () async {
                  try {
                    await registerUser();
                  } on FirebaseAuthException catch (ex) {
                    if (ex.code == 'weak-password') {
                      showSnackBar(context, 'weak-password');
                    } else if (ex.code == 'email-already-in-use') {
                      showSnackBar(context, "email already in use");
                    }
                  } catch (e) {
                    showSnackBar(context, e.toString());
                  }
                  showSnackBar(context, "success");
                },
                title: "Register",
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account!",
                    style: TextStyle(color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context, LoginView.id);
                    },
                    child: Text(
                      " Login",
                      style: TextStyle(color: AppColors.kRowTextColor),
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

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> registerUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
