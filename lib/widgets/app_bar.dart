import 'package:flutter/material.dart';
import 'package:rti/config/theme.dart';

class AppBarTitle extends StatelessWidget {
  final String title;

  const AppBarTitle({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
