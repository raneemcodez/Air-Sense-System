import 'package:airaystem/core/constant/color.dart';
import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  final void Function()? onTap;
  final IconData iconData;
  final String label;

  const BuildButton({
    super.key,
    required,
    required this.iconData,
    this.onTap,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 60),
        child: Column(
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: AppColor.green.withOpacity(0.1),
              child: Icon(iconData, size: 68, color: AppColor.gray),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
