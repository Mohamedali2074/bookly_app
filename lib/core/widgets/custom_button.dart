import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({
    super.key,
    required this.backGroundColor,
    required this.textColor,
    this.borderRadius,
    required this.text,
  });

  final Color backGroundColor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: backGroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(16),
          ),
        ),
        child: Text(text,
            style: Styles.textStyle20.copyWith(
              color: textColor,
              fontWeight: FontWeight.w900,
            )),
      ),
    );
  }
}
