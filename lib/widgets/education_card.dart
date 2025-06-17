import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../models/education_model.dart';

class EducationCard extends StatefulWidget {
  final Education education;
  
  const EducationCard({
    Key? key,
    required this.education,
  }) : super(key: key);
  
  @override
  State<EducationCard> createState() => _EducationCardState();
}

class _EducationCardState extends State<EducationCard> {
  bool _isHovered = false;
  bool _isExpanded = false;
  
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 24),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: _isHovered ? AppColors.bgSecondary : AppColors.cardBg,
          borderRadius: BorderRadius.circular(AppDimensions.borderRadiusL),
          border: Border.all(
            color: _isHovered ? AppColors.secondaryColor.withOpacity(0.5) : AppColors.cardBorder,
            width: 1.5,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppColors.secondaryColor.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  )
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (widget.education.logoUrl != null) ...[
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      widget.education.logoUrl!,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.school,
                          color: AppColors.textSecondary,
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.education.degree,
                        style: AppTextStyles.titleStyle.copyWith(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.education.institution,
                        style: AppTextStyles.bodyStyle.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppDimensions.borderRadiusS),
                    border: Border.all(
                      color: AppColors.secondaryColor.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    widget.education.duration,
                    style: AppTextStyles.bodyStyle.copyWith(
                      color: AppColors.secondaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            if (widget.education.description != null) ...[
              const SizedBox(height: 16),
              Text(
                widget.education.description!,
                style: AppTextStyles.bodyStyle,
              ),
            ],
            if (widget.education.achievements != null && widget.education.achievements!.isNotEmpty) ...[
              const SizedBox(height: 16),
              InkWell(
                onTap: () => setState(() => _isExpanded = !_isExpanded),
                child: Row(
                  children: [
                    Text(
                      'Achievements',
                      style: AppTextStyles.bodyStyle.copyWith(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                      color: AppColors.secondaryColor,
                      size: 20,
                    ),
                  ],
                ),
              ),
              if (_isExpanded) ...[
                const SizedBox(height: 12),
                ...widget.education.achievements!.map((achievement) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.star,
                          color: AppColors.secondaryColor,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            achievement,
                            style: AppTextStyles.bodyStyle,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ],
            ],
          ],
        ),
      ),
    );
  }
} 