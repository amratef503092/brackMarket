import 'package:flutter/material.dart';

class CustomGrideView extends StatelessWidget {
  const CustomGrideView({super.key, required this.itemCount, required this.widgetBuilder});
   final Widget Function(int) widgetBuilder;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return widgetBuilder(index);
        },
        itemCount: itemCount);
  }
}
