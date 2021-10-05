import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String label;
  final Function onTap;

  RoundButton({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 220,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Color(0xFF4C4B63),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      onTap: onTap as Function(),
    );
  }
}
