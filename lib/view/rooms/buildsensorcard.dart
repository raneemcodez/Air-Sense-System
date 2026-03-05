import 'package:airaystem/core/constant/color.dart';
import 'package:flutter/material.dart';

class BuildSensorCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData iconData;

  const BuildSensorCard({
    super.key,
    required this.title,
    required this.value,
    required this.iconData,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: AppColor.green.withOpacity(0.3))],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColor.secondColor,
            child: Icon(
              iconData,
              size: 36,
              color: AppColor.green.withOpacity(0.5),
            ),
          ),

          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColor.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColor.black.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
