

import 'package:firebase_auth/firebase_auth.dart';


abstract class RegisterRepo
{
  Future<User> registerUser
  ({
 required  String email,required String password
  });
}