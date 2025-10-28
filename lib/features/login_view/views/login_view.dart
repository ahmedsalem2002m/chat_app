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
            TextFormField(
              decoration: InputDecoration(
                hintText: "Email",
                hintStyle: TextStyle(
                  color: Colors.white
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white
                    )
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white
                  )
                )
              ),
            ),
            Spacer(flex: 1,),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(
                  color: Colors.white
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white
                    )
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white
                  )
                )
              ),
            ),
            Spacer(flex: 7,),
          ],
        ),
      ),
    );
  }
}
