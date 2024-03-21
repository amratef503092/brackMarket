import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renters/core/custom_widgets/custom_card_widget.dart';
import 'package:renters/core/custom_widgets/custom_gride_view.dart';
import 'package:renters/view/calclator/view/controllers/crypto_cubit.dart';

import '../../../../core/custom_widgets/custom_app_bar.dart';
import '../../../../core/custom_widgets/custom_text.dart';
import '../../../../core/utility/style_text_manager/text_style_manager.dart';
import '../../../../core/utility/text_manager/text_manger.dart';
import '../../../layout/view/controllers/layout_cubit.dart';

class CryptoPage extends StatelessWidget {
  const CryptoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarCustom(context),
        body: Center(
          child: BlocConsumer<CryptoCubit, CryptoState>(
            listener: (context, state) 
            {

            },
            builder: (context, state) {
              var cryptoList = context.read<CryptoCubit>().currencyList;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomGrideView(
                    widgetBuilder: ( index) 
                    {
                      return 
                      FadeInDown(
                        child: CustomRowCard(
                          currency: cryptoList[index].name,
                          price: cryptoList[index].price.toStringAsFixed(2),
                          logo: cryptoList[index].logo,
                        ),
                      );
                    },
                   
                    itemCount: cryptoList.length),
              );
            },
          ),
        ));
  }
}
