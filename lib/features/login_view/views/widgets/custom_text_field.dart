import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({super.key, this.textHint,this.onChanged,this.validator,this.obscureText = false});
  String? textHint;
  Function(String)? onChanged;
   final String? Function(String?)? validator;
   bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:obscureText,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: textHint,
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
    );
  }
}
