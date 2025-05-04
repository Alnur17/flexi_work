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
        CircleAvatar(
          backgroundImage: NetworkImage(imagePath),
          radius: 35,
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style:  h5.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
