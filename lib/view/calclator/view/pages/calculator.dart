import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renters/core/custom_widgets/custom_card_widget.dart';
import 'package:renters/core/custom_widgets/custom_gride_view.dart';
import 'package:renters/view/calclator/view/controllers/crypto_cubit.dart';
import '../../../../core/custom_widgets/custom_app_bar.dart';

class CryptoPage extends StatelessWidget {
  const CryptoPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarCustom(context),
        bottomSheet: SizedBox(
          height: 50,
          // color: Colors.blue,
          child: ElevatedButton(
            onPressed: () {
              context.read<CryptoCubit>().getCryptoData();
            },
            child: const Text("Refresh"),
          ),
        ),
        body: Center(
          child: BlocConsumer<CryptoCubit, CryptoState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cryptoList = context.read<CryptoCubit>().currencyList;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomGrideView(
                    widgetBuilder: (index) {
                      return FadeInDown(
                        child: CustomRowCard(
                          coinModel: cryptoList[index],
                          sympol: 'USD',
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
