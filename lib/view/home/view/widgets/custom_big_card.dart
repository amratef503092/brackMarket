import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/custom_widgets/custom_text.dart';
import '../../../../core/utility/assets_manger/assets_manager.dart';
import '../../../../core/utility/color_manager/color_manager.dart';
import '../../../../core/utility/style_text_manager/text_style_manager.dart';
class CustomBigCard extends StatelessWidget {
  const CustomBigCard({
    super.key,
    required this.priceText,
  });
  final String priceText;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            Row(
              children:
              [
                const
                Image(image: AssetImage(
                  AssetsManager.unitedStateLogo,
                ),
                  height: 32.0,
                  width: 32.0,
                ),
                const SizedBox(width: 8.0,),
                customText(text: 'USD / EGP',
                  style: boldTextStyle.copyWith(
                    fontSize: 24.0.sp,
                  ),
                ),
              ],
            ) ,
            const SizedBox(height: 8.0,),
            customText(text: 'Today In The Black Market In Egypt',
              style: boldTextStyle.copyWith(
                fontSize: 14.0.sp,
                color: ColorManager.greyColor,
              ),
            ),
            const SizedBox(height: 16.0,),
            Align(
              alignment: Alignment.center,
              child: customText(text: priceText,
                style: extraBoldTextStyle.copyWith(
                  fontSize: 90.0.sp,
                ),
              ),
            ),


          ],
        ),
      ),

    );
  }
}
