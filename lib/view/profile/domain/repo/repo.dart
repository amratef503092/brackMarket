import 'package:renters/view/profile/data/model/user_model.dart';

abstract class ProfileRepo
{
  Future<void> signOut();
  Future<void> deleteAccount();
  Future<void> updateProfile( UserModel userModel, 
);
  Future<void> updatePassword
  ({required String password});
  Future<void> updateProfileImage
  ({required String imagePath});
  Future<void> updatePhoneNumber
  ({required String phoneNumber});

  Future<UserModel> getProfile();
}