import 'package:flutter/material.dart';
FormFieldValidator emailValidator = (value) 
{
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }
  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
    return 'Please enter a valid email';
  }
  return null;
};
FormFieldValidator passwordValidator = (value) 
{
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  }
  if (value.length < 6) {
    return 'Password must be at least 6 characters long';
  }
  return null;
};
RegExp nameRegExp = RegExp(r'^[A-Za-z ]+$');
FormFieldValidator nameValidator = (value) 
{
  
  if (value == null || value.isEmpty) {
    return 'Please enter your first name';
  }else if(!nameRegExp.hasMatch(value))
  {
    return 'Please enter a valid first name';
  }
  return null;
};