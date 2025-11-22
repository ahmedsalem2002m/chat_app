import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({super.key, this.textHint,this.onChanged});
  String? textHint;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
