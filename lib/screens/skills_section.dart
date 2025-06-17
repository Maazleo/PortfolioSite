import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../models/education_model.dart';
import '../utils/responsive.dart';
import '../widgets/skill_card.dart';
import '../widgets/section_title.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: Responsive.responsivePadding(context: context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: SectionTitles.skills,
            subtitle: 'My technical expertise',
          ),
          _buildSkillsCategories(context),
        ],
      ),
    );
  }
  
  Widget _buildSkillsCategories(BuildContext context) {
    final skillsByCategory = Skill.getSkillsByCategory();
    final isMobile = Responsive.isMobile(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: skillsByCategory.entries.map((entry) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              entry.key,
              style: AppTextStyles.titleStyle.copyWith(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 24),
            isMobile
                ? _buildMobileSkillGrid(entry.value)
                : _buildDesktopSkillGrid(entry.value),
            const SizedBox(height: 48),
          ],
        );
      }).toList(),
    );
  }
  
  Widget _buildDesktopSkillGrid(List<Skill> skills) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 1.5,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: skills.length,
      itemBuilder: (context, index) {
        return SkillCard(skill: skills[index]);
      },
    );
  }
  
  Widget _buildMobileSkillGrid(List<Skill> skills) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.3,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: skills.length,
      itemBuilder: (context, index) {
        return SkillCard(skill: skills[index]);
      },
    );
  }
} 