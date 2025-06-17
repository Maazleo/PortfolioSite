import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../models/education_model.dart';
import '../utils/responsive.dart';
import '../widgets/education_card.dart';
import '../widgets/section_title.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: Responsive.responsivePadding(context: context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: SectionTitles.education,
            subtitle: 'My academic background',
          ),
          _buildEducationList(context),
        ],
      ),
    );
  }
  
  Widget _buildEducationList(BuildContext context) {
    final educationList = Education.sampleEducation;
    
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: educationList.length,
      itemBuilder: (context, index) {
        return EducationCard(education: educationList[index]);
      },
    );
  }
} 