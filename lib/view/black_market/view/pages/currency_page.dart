import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renters/core/custom_widgets/custom_gride_view.dart';
import 'package:renters/view/black_market/view/controllers/currency_cubit.dart';

import '../../../../core/custom_widgets/custom_app_bar.dart';
import '../../../../core/custom_widgets/custom_card_widget.dart';
import '../../../../core/custom_widgets/custom_text.dart';
import '../../../../core/utility/assets_manger/assets_manager.dart';
import '../../../../core/utility/style_text_manager/text_style_manager.dart';
import '../../../../core/utility/text_manager/text_manger.dart';
import '../../../layout/view/controllers/layout_cubit.dart';

class CurrencyPage extends StatelessWidget {
  const CurrencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CurrencyCubit, CurrencyState>(
      listener: (context, state) 
      {

      },
      builder: (context, state) {
        var currencyList = context.read<CurrencyCubit>().currencyList;
        return Scaffold(
            appBar: appBarCustom(context),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child:  CustomGrideView(
                itemCount: currencyList.length,
               widgetBuilder: 
                (index) {
                return   CustomRowCard(
                      currency: currencyList[index].name,
                      price: currencyList[index].price.toString(),
                      logo: currencyList[index].logo,
                    );
                    }
                    ),
            ));
      },
    );
  }
}
