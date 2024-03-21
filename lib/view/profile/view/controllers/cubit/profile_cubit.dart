import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:renters/view/profile/data/model/user_model.dart';
import 'package:renters/view/profile/domain/repo/repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> 
{
  ProfileCubit(this.profileRepo) : super(ProfileInitial());
  ProfileRepo profileRepo;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String ? phone;
  String ?countryCode;
  UserModel? profile;

  Future<void> updateProfileInfo() 
  async
  {
    emit(ProfileLoading());

    try
    {
      UserModel userModel 
      =   profile!.copyWith(
        name: firstName.text,
        phone: phoneController.text,
        countryCode: countryCode
      );
      print(userModel.name);
       FirebaseFirestore.instance.collection('user_info').
       doc(profile!.id).
       update(userModel.toJson());
      print("Amrrrrrr");
      emit(ProfileLoaded(userModel));
    } on Exception catch (e) 
    {
      print(e);
      emit(ProfileError());
    }
    
  }
  Future<void> getProfileInfo()
  async
  {
    emit(ProfileLoading());
    try
    {
       profile = await profileRepo.getProfile();
       print(profile!.address);
      emit(ProfileLoaded(profile!));
    }
    catch(e)
    {
      print(e);
      emit(ProfileError());
    }
  }
  Future<void> logout()
  async 
  {
    emit(ProfileLoading());
    try{
      await profileRepo.signOut();
      emit(ProfileLogout());
    }
    catch(e)
    {
      print(e);
      emit(ProfileError());
    }
  }
}
