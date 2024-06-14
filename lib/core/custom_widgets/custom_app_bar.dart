import 'package:flutter/material.dart';
import 'package:renters/view/themeController/theme_cubit.dart';

import '../../view/layout/view/controllers/layout_cubit.dart';
import '../utility/style_text_manager/text_style_manager.dart';
import '../utility/text_manager/text_manger.dart';
import 'custom_text.dart';

PreferredSizeWidget appBarCustom(BuildContext context)
{
  return AppBar(
    actions: [
      IconButton(
        onPressed: ()
        {
          LayoutCubit.get(context).changeLanguage(context);
        },
        icon: const Icon(Icons.language),
      ),
      IconButton(
        onPressed: ()
        {
          ThemeCubit.get(context).changeTheme();
        },
        icon:
        const Icon(Icons.light_mode ,
        ),
      ),


    ],
    title: customText(text:
    TextManager.appName,
      style:
      extraBoldTextStyle.
      copyWith(
        fontSize: 24.0,
      ),
    ),
  );
}