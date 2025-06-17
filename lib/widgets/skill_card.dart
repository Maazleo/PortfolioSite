import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../models/education_model.dart';
import '../utils/responsive.dart';

class SkillCard extends StatefulWidget {
  final Skill skill;
  
  const SkillCard({
    Key? key,
    required this.skill,
  }) : super(key: key);
  
  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool _isHovered = false;
  
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _isHovered ? AppColors.bgSecondary : AppColors.cardBg,
          borderRadius: BorderRadius.circular(AppDimensions.borderRadiusM),
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
              children: [
                if (widget.skill.iconPath != null) ...[
                  Container(
                    width: 32,
                    height: 32,
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppDimensions.borderRadiusS),
                    ),
                    child: Image.asset(
                      widget.skill.iconPath!,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.code,
                          color: AppColors.secondaryColor,
                          size: 20,
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
                Text(
                  widget.skill.name,
                  style: AppTextStyles.bodyStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Stack(
              children: [
                Container(
                  height: 8,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.bgPrimary,
                    borderRadius: BorderRadius.circular(AppDimensions.borderRadiusS),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 800),
                  height: 8,
                  width: (Responsive.getScreenWidth(context) - 32) * widget.skill.proficiency * 0.25,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.secondaryColor,
                        AppColors.secondaryColor.withOpacity(0.7),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(AppDimensions.borderRadiusS),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Proficiency',
                  style: AppTextStyles.bodyStyle.copyWith(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
                Text(
                  '${(widget.skill.proficiency * 100).toInt()}%',
                  style: AppTextStyles.bodyStyle.copyWith(
                    fontSize: 12,
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} 