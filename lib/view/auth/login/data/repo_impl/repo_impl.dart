import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/services/firebase_auth_service/firebase_auth_service.dart';
import '../../domain/repo/login_repo.dart';

class LoginRepoImpl implements LoginRepo 
{
  final FirebaseAuthService _firebaseAuth;

  LoginRepoImpl({required FirebaseAuthService firebaseAuth}) : _firebaseAuth = firebaseAuth;

  @override
  Future<User> signInWithEmailAndPassword({required String email, required String password}) async 
  {
    try 
    {
      final userCredential =
       await _firebaseAuth.
       signInWithEmailAndPassword(email: email, password: password);
      return userCredential!;
    } 
    on FirebaseAuthException catch (e) 
    {
      throw LoginException(message: e.message!);
    }
  }
}
class LoginException implements Exception 
{
  final String message;

  LoginException({required this.message});
}