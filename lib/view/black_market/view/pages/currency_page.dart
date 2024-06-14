import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renters/core/custom_widgets/custom_gride_view.dart';
import 'package:renters/view/black_market/view/controllers/currency_cubit.dart';

import '../../../../core/custom_widgets/custom_app_bar.dart';
import '../../../../core/custom_widgets/custom_card_widget.dart';

class CurrencyPage extends StatelessWidget {
  const CurrencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CurrencyCubit, CurrencyState>(
      listener: (context, state) {},
      builder: (context, state) {
        var currencyList = context.read<CurrencyCubit>().currencyList;
        return Scaffold(
            appBar: appBarCustom(context),
            bottomSheet: SizedBox(
              height: 50,
              // color: Colors.blue,
              child: ElevatedButton(
                onPressed: () {
                  context.read<CurrencyCubit>().geCurrencyData();
                },
                child: const Text("Refresh"),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.0.w, vertical: 20.h),
              child: CustomGrideView(
                  itemCount: currencyList.length,
                  widgetBuilder: (index) {
                    return CustomRowCard(
                      coinModel: currencyList[index],
                    );
                  }),
            ));
      },
    );
  }
}
