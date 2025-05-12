import 'dart:io'; // Import for File
import 'package:flutter/material.dart';

import '../../../../../../common/app_text_style/styles.dart';
import '../app_color/app_colors.dart';

class UploadWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String imagePath;
  final String label;
  final double height;
  final double width;
  final double iconSize;
  final TextStyle? labelStyle;
  final bool isFile; // Indicates if imagePath is a file

  const UploadWidget({
    super.key,
    required this.onTap,
    required this.imagePath,
    required this.label,
    this.height = 120,
    this.width = double.infinity,
    this.iconSize = 20,
    this.labelStyle,
    this.isFile = false, // Default to false (asset)
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.grey,
            style: BorderStyle.solid,
          ),
        ),
        child: isFile
            ? ClipRRect(
          borderRadius: BorderRadius.circular(12),
              child: Image.file(
                        File(imagePath),
                        fit: BoxFit.cover,
                        height: height,
                        width: width,
                        errorBuilder: (context, error, stackTrace) => const Icon(
              Icons.error,
              color: Colors.red,
              size: 20,
                        ),
                      ),
            )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            Container(
              height: iconSize,
              width: iconSize,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                imagePath,
                scale: 4,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: labelStyle ?? h5.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}