import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:renters/view/auth/register/domain/repo/register_repo.dart';
import 'package:renters/view/profile/data/model/user_model.dart';

import '../../../../data/repo_impl/register_repo_impl.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> 
{
  RegisterCubit(this.registerRepo) : super(RegisterInitial());
  RegisterRepo registerRepo;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
   String  ? countryCode;

  bool isPassword = true;
  bool isConfirmPassword = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    emit(RegisterChangePasswordVisibility());
  }
  Future<void>register()
  async
  {
    if (formKey.currentState!.validate())
    {
      emit(RegisterLoading());
      try
      {
        final user = await registerRepo.registerUser(
          email: emailController.text,
          password: passwordController.text
        );

        user.
        updateDisplayName("${firstName.text} ${lastName.text}");
        UserModel userModel = UserModel(
          id: user.uid,
          email: user.email,
          name: "${firstName.text} ${lastName.text}",
          phone: phoneController.text,
          image: 'https://firebasestorage.googleapis.com/v0/b/coin-5b807.appspot.com/o/vecteezy_illustration-of-human-icon-vector-user-symbol-icon-modern_8442086.jpg?alt=media&token=adada335-9b8b-42c7-8d1c-42af8e8c250a',
          countryCode: countryCode
        );
        FirebaseFirestore.instance.
        collection('user_info').
        doc(user.uid).set(
          userModel.toJson()
        );
        emit(RegisterSuccess(user: user));
      }
      on RegisterException catch (e)
      {
        emit(RegisterFailed(message: e.message));
      }
    }

  }
  
}
