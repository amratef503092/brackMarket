import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:renters/view/auth/login/data/repo_impl/repo_impl.dart';
import 'package:renters/view/auth/login/domain/repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> 
{
  LoginCubit({required this.loginRepo}) : super(LoginInitial());
  LoginRepo loginRepo;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;

  void togglePasswordVisibility() 
  {
    isPasswordVisible = !isPasswordVisible;
    emit(LoginInitial());
  }
  void login() async 
  {
    emit(LoginLoading());
    try 
    {
      final user = await loginRepo.
      signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
      emit(LoginSuccess(user: user));
    } 
    on LoginException catch (e) 
    {
      emit(LoginFailed(message: e.message));
    }
  }
  
}
