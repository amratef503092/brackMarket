import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utility/color_manager/color_manager.dart';
import '../utility/style_text_manager/text_style_manager.dart';
import 'custom_text.dart';
class CustomRowCard extends StatelessWidget {
  const CustomRowCard({
    super.key,
    required  this.currency,
    required  this.price,
    required  this.logo,

  });
  final String currency;
  final String price;
  final String logo;
  @override
  Widget build(BuildContext context) {
    var title = tr(currency);
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0.r),
      ),

      child: Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                logo,
              ),
              width: 50.w,
              height: 50.h,
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
              text: 'EGP',
              args: [price],
              style:Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ),
    );
  }
}