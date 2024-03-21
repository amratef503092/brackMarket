import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool enabled;
  final TextInputAction textInputAction;
  final FocusNode focusNode;
  final String ? hintText;
  final IconData? prifexIcon;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final FormFieldValidator ? validator;
  final Widget ? suffixIcon;

  const CustomTextFormField({
    Key? key,
    required this.labelText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.enabled = true,
    this.textInputAction = TextInputAction.done,
    required this.focusNode,
    this.onChanged,
    this.onEditingComplete,
    this.validator,
    this.hintText,
    this.prifexIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) 
  {
    return TextFormField
    (
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prifexIcon != null ? Icon(prifexIcon) : null,
        labelText: labelText,
        suffixIcon: suffixIcon
      ),
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      enabled: enabled,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      validator: validator,
    );
  }
}

