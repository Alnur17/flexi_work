import 'package:flutter/material.dart';

import '../../../../../../common/app_text_style/styles.dart';

class ExploreAndShopList extends StatelessWidget {
  final String imagePath;
  final String label;

  const ExploreAndShopList({
    super.key,
    required this.imagePath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.green[50],
          ),
          child: Image.asset(
            imagePath,
            scale: 4,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: h5.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
