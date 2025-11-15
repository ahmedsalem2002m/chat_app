import 'package:chat_app/features/login_view/views/login_view.dart';
import 'package:chat_app/features/login_view/views/widgets/custom_button.dart';
import 'package:chat_app/features/login_view/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2B475E),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Spacer(flex: 3),
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
            Spacer(flex: 3),
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
            CustomTextField(textHint: "Name"),
            SizedBox(height: 8),
            CustomTextField(textHint: "Email"),
            SizedBox(height: 8),
            CustomTextField(textHint: "Password"),
            SizedBox(height: 16),
            CustomButton(title: "Register"),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginView()),
                    );
                  },
                  child: Text(
                    " Login",
                    style: TextStyle(color: Color(0xffCdEDE6)),
                  ),
                ),
              ],
            ),
            Spacer(flex: 5),
          ],
        ),
      ),
    );
  }
}
