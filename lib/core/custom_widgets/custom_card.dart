import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utility/style_text_manager/text_style_manager.dart';
import 'custom_text.dart';
class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.text,
     this.stylePrice = const  TextStyle(
       fontSize: 32.0,
       fontWeight: FontWeight.w900,
     ),
     this.styleTitle = const  TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.w900,
  ),
    required this.width,
    required this.height,
    required this.price,
     this.color = Colors.white,

  });
  final String text;
  final TextStyle styleTitle;
  final TextStyle stylePrice;
  final double width;
  final double height;
  final String price;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        // color: color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:
            [
              customText(text: price ,
                style: stylePrice,
              ),
              customText(text: text ,
                style: styleTitle,
              ),
            ],
          )
      ),
    );
  }
}
