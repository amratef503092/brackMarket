

import 'package:firebase_auth/firebase_auth.dart';
import 'package:renters/core/services/firebase_firestore_service/firebase_firestore_service.dart';
import 'package:renters/view/profile/data/model/user_model.dart';
import 'package:renters/view/profile/domain/repo/repo.dart';

import '../../../core/services/firebase_storage_service/firebase_storage_service.dart';

class ProfileRepoImpl extends ProfileRepo
{
  CloudFirebaseService cloudFirebaseService;
  FirebaseStorageService firebaseStorageService;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  ProfileRepoImpl({required this.cloudFirebaseService , 
  required this.firebaseStorageService
  });
  
  @override
  Future<void> deleteAccount() 
  async 
  {
  
  }
  
  @override
  Future<void> signOut() 
  async{
    try{
     await _firebaseAuth.signOut();
    }
    catch(e)
    {
      print(e.toString());
      rethrow;
    }

    }
  
  @override
  Future<void> updatePassword({required String password}) 
  {
       throw UnimplementedError();

  }
  
  @override
  Future<void> updatePhoneNumber({required String phoneNumber}) {
    // TODO: implement updatePhoneNumber
    throw UnimplementedError();
  }
  
  
  
  @override
  Future<void> updateProfileImage({required String imagePath}) 
  {
        throw UnimplementedError();

  }
  
  @override
 Future<UserModel> getProfile()
  async
  {
    try{
      final user = _firebaseAuth.currentUser;
       final data = await cloudFirebaseService.getDocument(user!.uid);
       print(data.data());
        UserModel userModel = UserModel.fromJson(data.data() as Map<String, dynamic>);
        return userModel;

    }
    catch(e)
    {
      print(e.toString());
      rethrow;
    }
  }
  
  @override
  Future<void> updateProfile(UserModel userModel) 
  async{
    try{
      
      final user =  _firebaseAuth.currentUser;
      cloudFirebaseService.updateDocument( userModel.toJson() , user!.uid);
    }
    catch(e)
    {
      print(e.toString());
      rethrow;
    }
  }
  

}