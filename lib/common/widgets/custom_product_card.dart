import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_color/app_colors.dart';
import '../app_images/app_images.dart';
import '../app_text_style/styles.dart';

class CustomProductCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String price;
  final String discount;
  final double rating;
  final VoidCallback onCardTap;
  final VoidCallback onBookmarkTap;

  const CustomProductCard({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.price,
    required this.rating,
    required this.onCardTap,
    required this.onBookmarkTap,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTap, // Handle tap on the card
      child: SizedBox(
        width: Get.width * 0.6,
        child: Card(
          color: AppColors.mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.network(
                        imageUrl,
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: onBookmarkTap, // Handle tap on the bookmark icon
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.black38,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            AppImages.cartSmall,
                            scale: 4,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: GestureDetector(
                        onTap: onBookmarkTap, // Handle tap on the bookmark icon
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 4),
                          decoration: BoxDecoration(
                              color: AppColors.orange,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(12))),
                          child: Text(
                            '\$$price',
                            style: h5.copyWith(color: AppColors.white),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: onBookmarkTap, // Handle tap on the bookmark icon
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: AppColors.orange,
                              borderRadius: BorderRadius.circular(12)),
                          child: Text(
                            '-$discount%',
                            style: h6.copyWith(color: AppColors.white),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      left: 8,
                      child: GestureDetector(
                        onTap: onBookmarkTap, // Handle tap on the bookmark icon
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: Colors.black38,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 14,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                rating.toString(),
                                style: h6.copyWith(color: AppColors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    productName,
                    style: h5.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.black54),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
