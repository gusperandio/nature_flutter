import 'package:flutter/material.dart';

class ButtonSunshine extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  ButtonSunshine({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: const Color(0xFFFFBD16),
        ),
        onPressed: onPressed,
        child: Text(text,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            )));
  }
}
