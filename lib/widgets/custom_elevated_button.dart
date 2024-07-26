import 'package:flutter/material.dart';

class CustomElevatedButon extends StatelessWidget {
  final String title;
  final void Function()? onPressed;

  const CustomElevatedButon({super.key, required this.title, this.onPressed});

  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ));
  }
}
