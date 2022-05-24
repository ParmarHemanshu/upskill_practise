import 'package:breaking_bad_app/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class RatingView extends StatelessWidget {
  const RatingView({
    Key? key,
    required this.rating,
  }) : super(key: key);

  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('IMDB Rating : ',style: AppTextStyles.infoTitleStyle),
       const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < rating; i++)
              const Icon(Icons.star, color: Colors.amber)
          ],
        ),
      ],
    );
  }
}