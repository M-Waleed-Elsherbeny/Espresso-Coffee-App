import 'package:flutter/material.dart';

class  ToggleSwitcher extends StatelessWidget {
  const ToggleSwitcher({super.key, required this.onTap, required this.label, required this.isActive});
  final VoidCallback onTap;
  final String label;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        curve: Curves.linearToEaseOut,
        duration: Duration(seconds: 1),
        child: Container(
          width: 100,
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(30),
          ),
          alignment: Alignment.center,
          child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
