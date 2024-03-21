import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:renters/core/utility/color_manager/color_manager.dart';
import 'package:renters/core/utility/text_manager/text_manger.dart';
import 'package:renters/view/layout/view/controllers/layout_cubit.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
      },
      builder: (_, state) {
        var bloc = LayoutCubit.get(context);
        return Scaffold(
    
          body: bloc.screens.map((e) => e).toList()[bloc.currentIndex],
          bottomNavigationBar:
          BottomNavigationBar(
            onTap: (index) {
              LayoutCubit.get(context).changeIndex(index);
            },
            currentIndex: bloc.currentIndex,
            type: BottomNavigationBarType.fixed,
            items:

            [
              // BottomNavigationBarItem(
              //   icon: const Icon(Icons.home),
              //   label: TextManager.home.tr(),
              // ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.currency_pound),
                label: TextManager.currency.tr(),
              ),
              BottomNavigationBarItem(
                icon: const Icon(FontAwesomeIcons.wallet),
                label: TextManager.gold.tr(),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.currency_bitcoin),
                label: TextManager.crypto.tr(),
              ),
               BottomNavigationBarItem(
                icon: const Icon(Icons.person),
                label: TextManager.profile.tr(),
              ),

            ],
          ),
        );
      },
    );
  }
}
