import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../models/achievement_model.dart';
import '../utils/responsive.dart';
import '../widgets/achievement_card.dart';
import '../widgets/section_title.dart';

class AchievementsSection extends StatelessWidget {
  const AchievementsSection({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: Responsive.responsivePadding(context: context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: SectionTitles.achievements,
            subtitle: 'My professional accomplishments',
          ),
          _buildAchievementsList(context),
        ],
      ),
    );
  }
  
  Widget _buildAchievementsList(BuildContext context) {
    final achievements = Achievement.sampleAchievements;
    
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: achievements.length,
      itemBuilder: (context, index) {
        return AchievementCard(achievement: achievements[index]);
      },
    );
  }
} 