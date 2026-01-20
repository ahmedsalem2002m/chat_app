import 'package:chat_app/core/utils/app_assets.dart';
import 'package:chat_app/core/utils/app_colors.dart';
import 'package:chat_app/features/chat_view/views/chat_view.dart';
import 'package:chat_app/features/login_view/views/widgets/custom_button.dart';
import 'package:chat_app/features/login_view/views/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/show_snack_bar.dart';
import '../../register_view/views/register_view.dart';

class LoginView extends StatefulWidget {
   LoginView({super.key});
  static String id = "LoginView";

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String? email,password;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: 44,),
                Image.asset(AppAssets.kLogo),
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
                CustomTextField(textHint: "Email",
                  validator: (data){
                    if(data!.isEmpty){
                      return "email is required";
                    }
                    return null;
                  },
                onChanged: (data){
                  email = data;
                },),
                SizedBox(height: 8),
                CustomTextField(textHint: "Password",
                  obscureText: true,
                  validator: (data){
                    if(data!.isEmpty){
                      return "password is required";
                    }
                    return null;
                  },
                onChanged: (data){
                  password = data;
                },),
                SizedBox(height: 16),
                CustomButton(
                  title: "Sign In",
                  onTap: () async {
                    if (!(formKey.currentState?.validate() ?? false)) return;

                    setState(() {
                      isLoading = true;
                    });

                    try {
                      await loginUser();
                      Navigator.pushReplacementNamed(context,ChatView.id,arguments: email);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        showSnackBar(
                          context,
                          'No account found with this email. Please register first.',
                        );
                      } else if (e.code == 'wrong-password') {
                        showSnackBar(context, 'Incorrect password.');
                      } else if (e.code == 'invalid-email') {
                        showSnackBar(context, 'Invalid email address.');
                      } else {
                        showSnackBar(
                          context,
                          e.message ?? 'Login failed. Please try again.',
                        );
                      }
                    } finally {
                      if (mounted) {
                        setState(() {
                          isLoading = false;
                        });
                      }
                    }
                  },
                ),

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
      ),
    );
  }


  Future<void> loginUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
