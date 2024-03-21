import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renters/view/gold/view/controllers/gold_cubit.dart';
import '../../../../core/custom_widgets/custom_app_bar.dart';
import '../../../../core/custom_widgets/custom_card_widget.dart';
import '../../../../core/custom_widgets/custom_gride_view.dart';

class GoldPage extends StatelessWidget {
  const GoldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GoldCubit, GoldState>(
      listener: (context, state) 
      {
        
      },
      builder: (context, state) {
        var currencyList = context.read<GoldCubit>().currencyList;
        return Scaffold(
            appBar: appBarCustom(context),
            body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: 
                CustomGrideView(
                  itemCount: currencyList.length,
                  widgetBuilder: (index) => 
                  CustomRowCard(
                        currency: currencyList[index].name,
                        price: currencyList[index].price.toStringAsFixed(2),
                        logo: currencyList[index].logo,
                      )
                  ,
                ),
             ));
      },
    );
  }
}
