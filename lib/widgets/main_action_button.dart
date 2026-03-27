import 'package:flutter/material.dart';

class MainActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const MainActionButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff019879),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        child: Text(label, style: TextStyle(color: Color(0xffffffff))),
      ),
    );
  }
}
