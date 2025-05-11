import 'package:flexi_work/common/app_color/app_colors.dart';
import 'package:flexi_work/common/size_box/custom_sizebox.dart';
import 'package:flutter/material.dart';

import '../app_text_style/styles.dart';
import '../widgets/custom_button.dart';

class ServiceOfferCard extends StatelessWidget {
  final String title;
  final String clientName;
  final String date;
  final String time;
  final String location;
  final VoidCallback onAccept;
  final VoidCallback onReject;

  const ServiceOfferCard({
    super.key,
    required this.title,
    required this.clientName,
    required this.date,
    required this.time,
    required this.location,
    required this.onAccept,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.blue)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: h3.copyWith(fontWeight: FontWeight.w700),
          ),
          sh8,
          Text(
            'Client: $clientName',
            style: h4,
          ),
          sh5,
          Row(
            children: [
              Icon(Icons.calendar_today, size: 20),
              sw5,
              Text(
                date,
                style: h5,
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.access_time, size: 20),
              sw5,
              Text(
                time,
                style: h5,
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.location_on, size: 20),
              sw5,
              Text(
                location,
                style: h5,
              ),
            ],
          ),
          sh16,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomButton(
                  text: 'Accept Offer',
                  onPressed: onAccept,
                  backgroundColor: AppColors.transparent,
                  borderColor: AppColors.green,
                  textColor: AppColors.green,
                ),
              ),
              sw12,
              Expanded(
                child: CustomButton(
                  text: 'Reject Offer',
                  onPressed: onReject,
                  backgroundColor: AppColors.transparent,
                  borderColor: AppColors.red,
                  textColor: AppColors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
