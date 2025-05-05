import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String imagePath;
  final String checkBox;
  final String productName;
  final String brand;
  final String color;
  final int quantity;
  final String totalPrice;

  const CartItem({
    super.key,
    required this.imagePath,
    required this.productName,
    required this.brand,
    required this.color,
    required this.quantity,
    required this.totalPrice,
    required this.checkBox,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          checkBox,
          scale: 4,
        ),
        Expanded(
          child: Card(
            color: Colors.white,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      imagePath,
                      scale: 4,
                      fit: BoxFit.cover,
                      width: 80,
                      height: 80,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Brand: $brand',
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Color: $color',
                          style: const TextStyle(fontSize: 14),
                        ),
                        Row(
                          children: [
                            Text(
                              'Quantity: $quantity',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              'Total: $totalPrice',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
