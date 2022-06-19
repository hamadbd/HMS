import 'package:flutter/material.dart';

class WidthSizedBox extends StatelessWidget {
  final double w;
  const WidthSizedBox({required this.w});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * w,
    );
  }
}

class HeightSizedBox extends StatelessWidget {
  final double h;
  const HeightSizedBox({required this.h});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * h,
    );
  }
}