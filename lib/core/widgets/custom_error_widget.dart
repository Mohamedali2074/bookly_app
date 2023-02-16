import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMeesage});

  final String errMeesage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMeesage,
        style: Styles.textStyle16,
        textAlign: TextAlign.center,
      ),
    );
  }
}
