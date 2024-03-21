

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:renters/view/auth/register/domain/repo/register_repo.dart';

import '../../../../../core/error/failuar.dart';
import '../../../../../core/services/firebase_auth_service/firebase_auth_service.dart';

class RegisterRepoImpl extends RegisterRepo {
  final FirebaseAuthService firebaseAuth;

  RegisterRepoImpl({required this.firebaseAuth});

 

  @override
  Future<User> 
  registerUser({required  String email,required String password}) 
 async {
   try 
    {
      final userCredential =
       await firebaseAuth.
       createUserWithEmailAndPassword(email: email, password: password);
      return  userCredential! ;
    } 
    on FirebaseAuthException catch (e) 
    {
      throw RegisterException(message: e.message!);
    }
  }
  
}
class RegisterException implements Exception 
{
  final String message;

  RegisterException({required this.message});
}