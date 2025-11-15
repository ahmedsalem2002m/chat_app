import 'package:chat_app/features/login_view/views/widgets/custom_button.dart';
import 'package:chat_app/features/login_view/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2B475E),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Spacer(flex: 3,),
            Image.asset("assets/images/scholar.png"),
            Text(
              "Scholar Chat",
              style: TextStyle(
                fontFamily: "pacifico",
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: Colors.white
              ),
            ),
            Spacer(flex: 5,),
            Text(
              "Sign In",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.white
              ),
            ),
            CustomTextField(textHint: "Email",),
            Spacer(flex: 1,),
            CustomTextField(textHint: "Password",),
            Spacer(flex: 1,),
            CustomButton(),
            Spacer(flex: 7,),

          ],
        ),
      ),
    );
  }
}
