
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:renters/core/custom_widgets/custom_text.dart';
import 'package:renters/core/custom_widgets/custom_text_form_field.dart';
import 'package:renters/core/utility/easy_loading/eazy_loading.dart';
import 'package:renters/core/utility/service_locator/service_locator.dart';
import 'package:renters/core/utility/text_manager/text_manger.dart';
import 'package:renters/view/auth/login/presentation_layer/pages/login_screen/login_screen.dart';
import 'package:renters/view/profile/view/controllers/cubit/profile_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>()..getProfileInfo(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) 
        {
          if(state is ProfileLoaded)
          {
            hideEasyLoading();
            context.read<ProfileCubit>().emailController.text = state.profile.email!;
            context.read<ProfileCubit>().firstName.text = state.profile.name! ;
            context.read<ProfileCubit>().phoneController.text = state.profile.phone!;
            context.read<ProfileCubit>().countryCode = state.profile.countryCode!;
          }else if(state is ProfileLoading)
          {
            showEasyLoading();
          }else if(state is ProfileError)
          {
            EasyLoading.showError('Error');
          }else if(state is ProfileLogout)
          {
            hideEasyLoading();
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: 
            (context) {
              return const LoginScreen();
            },
            ), (route) => false);
          }
        },
        builder: (context, state) {
          ProfileCubit profileCubit = context.read<ProfileCubit>();
          return Scaffold(
              appBar: AppBar(
                title:  Text( context.tr(TextManager.profile)),
                actions: [
                  IconButton(icon: const Icon(Icons.logout), onPressed: () 
                  {
                   profileCubit.logout();
                  }),
                ],
              ),
              body: profileCubit.profile!=null?  
              SizedBox(
                width: 1.sw,
                height: 1.sh,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                         Center(
                           child: CircleAvatar(
                            radius: 70,
                            backgroundImage: NetworkImage(profileCubit.profile!.image!),
                              ),
                         ),
                          const SizedBox(
                          height: 20,
                        ),
                        customText(text: TextManager.nameUser),
                          const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          labelText: context.tr(TextManager.nameUser),
                        controller: profileCubit.firstName,
                        focusNode: FocusNode()),
                        const SizedBox(
                          height: 20,
                        ),
                        customText(text: TextManager.email),
                          const SizedBox(
                          height: 20,
                        ),
                         CustomTextFormField(
                          labelText: context.tr(TextManager.email),
                        controller: profileCubit.emailController,
                        focusNode: FocusNode()),
                          const SizedBox(
                          height: 20,
                        ),
                        customText(text: TextManager.phone),
                              const SizedBox(
                          height: 20,
                        ),
                          IntlPhoneField(
                        decoration:  
                        InputDecoration
                        (
                        
                          labelText: context.tr(TextManager.phone),
                          
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        initialValue: profileCubit.profile!.phone!,
                        initialCountryCode: 'EG',
                        onChanged: (phone) 
                        {
                          profileCubit.phoneController.text = phone.completeNumber;
                          profileCubit.countryCode = phone.countryCode;
                        },
                      ),

                      ElevatedButton(onPressed: ()
                      {
                        profileCubit.updateProfileInfo();
                      
                      }, 
                      child:  customText(text: TextManager.save)),
                      ],
                    ),
                  ),
                ),
              ) : const Center(child:   CircularProgressIndicator.adaptive(),)) ;
        },
      ),
    );
  }
}
