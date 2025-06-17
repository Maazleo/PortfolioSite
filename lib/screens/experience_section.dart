import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../models/experience_model.dart';
import '../utils/responsive.dart';
import '../widgets/experience_card.dart';
import '../widgets/section_title.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: Responsive.responsivePadding(context: context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: SectionTitles.experience,
            subtitle: 'My professional journey',
          ),
          _buildExperienceList(context),
        ],
      ),
    );
  }

  Widget _buildExperienceList(BuildContext context) {
    final experiences = Experience.sampleWorkExperiences;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: experiences.length,
      itemBuilder: (context, index) {
        return ExperienceCard(experience: experiences[index]);
      },
    );
  }
}
