import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renters/core/utility/service_locator/service_locator.dart';
import 'package:renters/core/utility/text_manager/text_manger.dart';
import 'package:renters/view/auth/login/presentation_layer/controller/cubit/cubit/login_cubit.dart';
import 'package:renters/view/auth/register/presentation_layer/view/register_screen.dart';
import 'package:renters/view/layout/view/pages/layout_page.dart';

import '../../../../../../core/custom_widgets/custom_text.dart';
import '../../../../../../core/custom_widgets/custom_text_form_field.dart';
import '../../../../../../core/utility/easy_loading/eazy_loading.dart';
import '../../../../../../core/utility/validator/validator.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: Scaffold(
          body: SizedBox(
        width: 1.sw,
        child: Padding(
          padding: EdgeInsets.all(14.0.sp),
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              LoginCubit loginCubit = context.read<LoginCubit>();
              return Form(
                key: context.read<LoginCubit>().formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100.h,
                      ),
                        customText(
                          text: 
                         TextManager.login,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: 40.sp),
                        ),
                      SizedBox(
                        height: 50.h,
                      ),
                      // TextFormField(
                      //     validator: emailValidator,
                      //     controller: loginCubit.emailController,
                      //   decoration: const InputDecoration(
                      //       labelText: TextManager.email,
                      //       prefixIcon: Icon(Icons.email),
                      //       hintText: TextManager.emailExample,
                      //     )),
                      CustomTextFormField(
                        focusNode: FocusNode(),
                        controller: loginCubit.emailController,
                        hintText: context.tr(TextManager.emailExample),
                        labelText: context.tr(TextManager.email),
                        prifexIcon: Icons.email,
                        validator: emailValidator,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        focusNode: FocusNode(),
                        controller: loginCubit.passwordController,
                        hintText: context.tr(TextManager.password),
                        labelText: context.tr(TextManager.password),
                        prifexIcon: Icons.lock,
                        validator: passwordValidator,
                        obscureText: loginCubit.isPasswordVisible,
                        suffixIcon: IconButton(
                          icon: loginCubit.isPasswordVisible
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                          onPressed: () => loginCubit.togglePasswordVisibility(),
                        ),
                      ),
                  
                      SizedBox(
                        height: 20.h,
                      ),
                      BlocConsumer<LoginCubit, LoginState>
                      (
                        listener: (context, state) {
                          if (state is LoginFailed) {
                            hideEasyLoading();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: customText(text: state.message)));
                          } else if (state is LoginSuccess) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LayoutScreen()));
                            hideEasyLoading();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content:
                                    customText(text: TextManager.loginSuccess)));
                          } else if (state is LoginLoading) {
                            showEasyLoading();
                          }
                        },
                        builder: (context, state) 
                        {
                          return ElevatedButton(
                            onPressed: () {
                              if (Form.of(context).validate()) 
                              {
                                context.read<LoginCubit>().login();
                              }
                            },
                            child: customText(text: TextManager.login , 
                            style: Theme.of(context).textTheme.bodyLarge!.
                            copyWith(fontSize: 20.sp)
                            ),
                          );
                        },
                      ),
                      // SizedBox(
                      //   height: 20.h,
                      // ),
                      // Align(
                      //   alignment: Alignment.centerRight,
                      //   child: TextButton(
                      //     onPressed: () {},
                      //     child: customText(
                      //         text: TextManager.forgetPassword,
                      //         style: Theme.of(context).textTheme.bodySmall!),
                      //   ),
                      // ),
                       SizedBox(
                          height: 20.h,
                        ),
                  
                        TextButton(
                          onPressed: () 
                          {
                  
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen()))    ;          
                          },
                          child: customText(
                              text: "${TextManager.dontHaveAccount} ${TextManager.signUp}",
                              style: Theme.of(context).textTheme.bodySmall!),
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
