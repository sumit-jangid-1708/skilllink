import "package:flutter/material.dart";

class GradientTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;

  const GradientTextField({
    super.key,
    required this.hintText,
    required this.obscureText,
    this.controller,
    required this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.9,
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [
          Color(0xFFFFD580), // soft yellow-orange top
          Color(0xFFFFA726), // deeper orange bottom
        ],
        begin: Alignment.topLeft,
          end: Alignment.bottomRight
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        margin: const EdgeInsets.all(1.8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          style: const TextStyle(fontSize: 16),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: prefixIcon != null
              ? Icon(prefixIcon, color: Colors.orangeAccent,)
                :null,
            suffixIcon: suffixIcon != null
              ?GestureDetector(
              onTap: onSuffixTap,
              child: Icon(suffixIcon, color: Colors.orangeAccent,),
            )
                :null,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
              borderSide: BorderSide.none,
            ),
            contentPadding:
              const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          ),
        ),
      ),
    );
  }
}
