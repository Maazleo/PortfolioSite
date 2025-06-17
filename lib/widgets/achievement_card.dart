import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_constants.dart';
import '../models/achievement_model.dart';

class AchievementCard extends StatefulWidget {
  final Achievement achievement;
  
  const AchievementCard({
    Key? key,
    required this.achievement,
  }) : super(key: key);
  
  @override
  State<AchievementCard> createState() => _AchievementCardState();
}

class _AchievementCardState extends State<AchievementCard> {
  bool _isHovered = false;
  
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.achievement.imageUrl != null) ...[
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppDimensions.borderRadiusM),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(12),
                child: Image.asset(
                  widget.achievement.imageUrl!,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.emoji_events,
                      color: AppColors.secondaryColor,
                      size: 40,
                    );
                  },
                ),
              ),
              const SizedBox(width: 20),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          widget.achievement.title,
                          style: AppTextStyles.titleStyle.copyWith(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      if (widget.achievement.date != null) ...[
                        const SizedBox(width: 16),
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
                            widget.achievement.date!,
                            style: AppTextStyles.bodyStyle.copyWith(
                              color: AppColors.secondaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  if (widget.achievement.issuedBy != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      'Issued by ${widget.achievement.issuedBy}',
                      style: AppTextStyles.bodyStyle.copyWith(
                        color: AppColors.textSecondary,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                  const SizedBox(height: 12),
                  Text(
                    widget.achievement.description,
                    style: AppTextStyles.bodyStyle,
                  ),
                  if (widget.achievement.certificateUrl != null) ...[
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton.icon(
                        onPressed: () => _launchURL(widget.achievement.certificateUrl!),
                        icon: const Icon(
                          Icons.verified,
                          color: AppColors.secondaryColor,
                          size: 18,
                        ),
                        label: Text(
                          'View Certificate',
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