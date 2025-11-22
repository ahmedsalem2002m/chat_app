import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({super.key,required this.title,this.onTap});
String title;
VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8)
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 16
            ),
          ),
        ),
      ),
    );
  }
}
