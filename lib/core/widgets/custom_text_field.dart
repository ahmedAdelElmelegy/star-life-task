import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  const CustomTextField({
    super.key,
    required this.hintText,
    this.validator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,

      decoration: InputDecoration(
        hintText: hintText,
        border: outlineBorder(color: Colors.grey),
        enabledBorder: outlineBorder(color: Colors.grey),
        focusedBorder: outlineBorder(color: Colors.blue),
        errorBorder: outlineBorder(color: Colors.red),
        focusedErrorBorder: outlineBorder(color: Colors.red),
      ),
    );
  }

  OutlineInputBorder outlineBorder({required Color color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.circular(10.r),
    );
  }
}
