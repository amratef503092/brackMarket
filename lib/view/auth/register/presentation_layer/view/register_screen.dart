
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:renters/core/utility/service_locator/service_locator.dart';
import 'package:renters/core/utility/text_manager/text_manger.dart';

import '../../../../../../core/custom_widgets/custom_text.dart';
import '../../../../../../core/custom_widgets/custom_text_form_field.dart';
import '../../../../../../core/utility/validator/validator.dart';
import '../../../../../core/utility/easy_loading/eazy_loading.dart';
import '../../../../layout/view/pages/layout_page.dart';
import '../controller/register_cubit/cubit/register_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterCubit>(),
      child: Scaffold(
          body: SizedBox(
        width: 1.sw,
        child: Padding(
          padding: EdgeInsets.all(14.0.sp),
          child: BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
              RegisterCubit registerCubit = context.read<RegisterCubit>();
              return Form(
                key: context.read<RegisterCubit>().formKey,
                child: 
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100.h,
                      ),
                      Text(
                        TextManager.signUp,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: 40.sp),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              focusNode: FocusNode(),
                              controller: registerCubit.firstName,
                              hintText: context.tr(TextManager.firstName),
                              labelText: context.tr(TextManager.firstName),
                              prifexIcon: Icons.person,
                              validator: nameValidator,
                            ),
                          ),
                          SizedBox(
                            width: 20.h,
                          ),
                          Expanded(
                            child: CustomTextFormField(
                              focusNode: FocusNode(),
                              controller: registerCubit.lastName,
                              hintText: context.tr(TextManager.lastName),
                              labelText: context.tr(TextManager.lastName),
                              prifexIcon: Icons.person,
                              validator: nameValidator,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        focusNode: FocusNode(),
                        controller: registerCubit.emailController,
                        hintText: TextManager.emailExample,
                        labelText: context.tr(TextManager.email),
                        prifexIcon: Icons.email,
                        validator: emailValidator,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      IntlPhoneField(
                        decoration:  
                        InputDecoration(
                          labelText: context.tr(TextManager.phoneNumber),
                    
                        ),
                        initialCountryCode: 'EG',
                        onChanged: (phone) 
                        {
                  
                          registerCubit.phoneController.text = phone.number;
                          registerCubit.countryCode = phone.countryCode;
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        focusNode: FocusNode(),
                        controller: registerCubit.passwordController,
                        hintText: context.tr(TextManager.password),
                        labelText: context.tr(TextManager.password),
                        prifexIcon: Icons.lock,
                        validator: passwordValidator,
                        obscureText: registerCubit.isPassword,
                        suffixIcon: IconButton(
                          icon: registerCubit.isPassword
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                          onPressed: () =>
                              registerCubit.changePasswordVisibility(),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      BlocConsumer<RegisterCubit, RegisterState>(
                        listener: (context, state) {
                          if (state is RegisterFailed) {
                            hideEasyLoading();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: customText(text: state.message)));
                          } else if (state is RegisterSuccess) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LayoutScreen()));
                            hideEasyLoading();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content:
                                    customText(text: TextManager.loginSuccess)));
                          } else if (state is RegisterLoading) {
                            showEasyLoading();
                          }
                        },
                        builder: (context, state) {
                          return ElevatedButton(
                            onPressed: () {
                              if (Form.of(context).validate() &&
                               context.read<RegisterCubit>().
                               phoneController.text.isNotEmpty) {
                                context.read<RegisterCubit>().register();
                              }
                            },
                            child: customText(
                                text: TextManager.signUp,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(fontSize: 20.sp)),
                          );
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      )),
    );
  }
}
