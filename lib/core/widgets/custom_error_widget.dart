import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';


class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMeesage});

  final String errMeesage;

  @override
  Widget build(BuildContext context) {
    return Text(errMeesage , style:Styles.textStyle18,);
  }
}
