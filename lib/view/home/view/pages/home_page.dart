import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renters/view/home/view/controllers/home_cubit.dart';
import '../../../../core/custom_widgets/custom_app_bar.dart';
import '../../../../core/custom_widgets/custom_card.dart';
import '../../../../core/custom_widgets/custom_card_widget.dart';
import '../widgets/custom_big_card.dart';

class HomePage extends StatelessWidget
{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var currencyList = context.read<HomeCubit>().currencyList;
        return Scaffold(
            appBar: appBarCustom(context),
            body: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 32.0, horizontal: 8.0),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomCard(
                          // color: ColorManager.primaryColor,
                          height: 150.h,
                          width: 1.sw / 3.2,
                          price: '1000',
                          text: 'USD',
                        ),
                        CustomCard(
                          // color: ColorManager.primaryColor,

                          height: 150.h,
                          width: 1.sw / 3.2,
                          price: '1000',
                          text: 'USD',
                        ),
                        CustomCard(
                          // color: ColorManager.primaryColor,

                          height: 150.h,
                          width: 1.sw / 3.2,
                          price: '1000',
                          text: 'USD',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    const CustomBigCard(
                      priceText: '62.15',
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return CustomRowCard(
                            coinModel: currencyList[index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 16.0,
                          );
                        },
                        itemCount: currencyList.length)
                  ],
                ),
              ),
            ));
      },
    );
  }
}
