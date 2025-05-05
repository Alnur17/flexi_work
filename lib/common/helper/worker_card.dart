import 'package:flexi_work/common/app_color/app_colors.dart';
import 'package:flexi_work/common/size_box/custom_sizebox.dart';
import 'package:flutter/material.dart';

class WorkerCard extends StatelessWidget {
  final String name;
  final String occupation;
  final double rating;
  final double hourlyRate;
  final String imageUrl;

  const WorkerCard({
    super.key,
    required this.name,
    required this.occupation,
    required this.rating,
    required this.hourlyRate,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.blue[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(imageUrl),
          ),
          SizedBox(height: 12.0),
          Text(
            name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            occupation,
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.blue),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    sw5,
                    Text(rating.toStringAsFixed(1)),
                  ],
                ),
              ),
              sw5,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.blue),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text('\$${hourlyRate.toStringAsFixed(0)}/hour'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
