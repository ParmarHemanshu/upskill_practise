import 'package:breaking_bad_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
          strokeWidth: 4, color: AppColors.primaryGreen),
    );
  }
}
