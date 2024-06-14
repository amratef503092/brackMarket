import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renters/core/models/coin_model.dart';
import 'package:renters/web_view/web_view.dart';
import '../utility/color_manager/color_manager.dart';
import 'custom_text.dart';

class CustomRowCard extends StatelessWidget {
  const CustomRowCard({
    super.key,
    required this.coinModel,
    this.sympol = 'EGP',
  });
  final CoinModel coinModel;
  final String sympol;
  @override
  Widget build(BuildContext context) {
    var title = tr(coinModel.name);
    return GestureDetector(
      onTap: () {
        if (coinModel.url == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: customText(
                text: 'No URL',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              backgroundColor: ColorManager.colorRed,
            ),
          );
          return;
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebView(
              url: coinModel.url!,
            ),
          ),
        );
      },
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 8.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(
                  coinModel.logo,
                ),
                width: 40.w,
                height: 40.h,
              ),
              const SizedBox(
                height: 10.0,
              ),
              FittedBox(
                child: customText(
                  text: title,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              customText(
                text: sympol,
                args: [coinModel.price.toString()],
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
