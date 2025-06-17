import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_constants.dart';
import '../models/experience_model.dart';

class ExperienceCard extends StatefulWidget {
  final Experience experience;
  
  const ExperienceCard({
    Key? key,
    required this.experience,
  }) : super(key: key);
  
  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool _isHovered = false;
  
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 32),
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
                if (widget.experience.logoUrl != null) ...[
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
                      widget.experience.logoUrl!,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.business,
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
                        widget.experience.title,
                        style: AppTextStyles.titleStyle.copyWith(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 4),
                      InkWell(
                        onTap: widget.experience.companyUrl != null
                            ? () => _launchURL(widget.experience.companyUrl!)
                            : null,
                        child: Text(
                          widget.experience.company,
                          style: AppTextStyles.bodyStyle.copyWith(
                            color: AppColors.secondaryColor,
                            fontWeight: FontWeight.w500,
                            decoration: widget.experience.companyUrl != null
                                ? TextDecoration.underline
                                : TextDecoration.none,
                          ),
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
                    widget.experience.duration,
                    style: AppTextStyles.bodyStyle.copyWith(
                      color: AppColors.secondaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              widget.experience.description,
              style: AppTextStyles.bodyStyle,
            ),
            const SizedBox(height: 16),
            ...widget.experience.responsibilities.map((responsibility) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.arrow_right,
                      color: AppColors.secondaryColor,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        responsibility,
                        style: AppTextStyles.bodyStyle,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            if (widget.experience.isFreelance && widget.experience.companyUrl != null) ...[
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => _launchURL(widget.experience.companyUrl!),
                  child: Text(
                    'View Profile',
                    style: AppTextStyles.buttonTextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
  
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
} 