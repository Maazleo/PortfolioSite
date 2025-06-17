import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../utils/responsive.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool isCenter;
  
  const SectionTitle({
    Key? key,
    required this.title,
    this.subtitle,
    this.isCenter = false,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isCenter ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: isCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            Container(
              height: 1,
              width: 40,
              color: AppColors.secondaryColor,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: Responsive.isMobile(context)
                  ? AppTextStyles.subHeadingStyle.copyWith(fontSize: 24)
                  : AppTextStyles.subHeadingStyle,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                height: 1,
                color: AppColors.secondaryColor.withOpacity(0.5),
              ),
            ),
          ],
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 16),
          Text(
            subtitle!,
            style: AppTextStyles.bodyStyle,
            textAlign: isCenter ? TextAlign.center : TextAlign.start,
          ),
        ],
        SizedBox(height: Responsive.isMobile(context) ? 32 : 48),
      ],
    );
  }
} 