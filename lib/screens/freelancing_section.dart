import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_constants.dart';
import '../models/experience_model.dart';
import '../utils/responsive.dart';
import '../widgets/experience_card.dart';
import '../widgets/section_title.dart';
import '../widgets/animated_button.dart';

class FreelancingSection extends StatelessWidget {
  const FreelancingSection({Key? key}) : super(key: key);
  
  Future<void> _navigateToFiverr() async {
    const String fiverrUrl = SocialLinks.fiverr;
    
    if (await canLaunchUrl(Uri.parse(fiverrUrl))) {
      await launchUrl(Uri.parse(fiverrUrl), mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $fiverrUrl';
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: Responsive.responsivePadding(context: context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: SectionTitles.freelancing,
            subtitle: 'My freelancing journey',
          ),
          _buildFreelanceExperience(context),
          const SizedBox(height: 40),
          _buildFreelanceServices(context),
        ],
      ),
    );
  }
  
  Widget _buildFreelanceExperience(BuildContext context) {
    final experiences = Experience.sampleFreelanceExperiences;
    
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: experiences.length,
      itemBuilder: (context, index) {
        return ExperienceCard(experience: experiences[index]);
      },
    );
  }
  
  Widget _buildFreelanceServices(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Services I Offer',
          style: AppTextStyles.titleStyle,
        ),
        const SizedBox(height: 24),
        Responsive.isMobile(context)
            ? _buildMobileServicesList(context)
            : _buildDesktopServicesList(context),
        const SizedBox(height: 40),
        Center(
          child: AnimatedButton(
            text: 'Hire Me on Fiverr',
            onPressed: _navigateToFiverr,
            icon: Icons.shopping_bag,
          ),
        ),
      ],
    );
  }
  
  Widget _buildDesktopServicesList(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildServiceCard('Flutter App Development', Icons.phone_android)),
        const SizedBox(width: 24),
        Expanded(child: _buildServiceCard('UI/UX Design', Icons.design_services)),
        const SizedBox(width: 24),
        Expanded(child: _buildServiceCard('App Maintenance', Icons.build)),
      ],
    );
  }
  
  Widget _buildMobileServicesList(BuildContext context) {
    return Column(
      children: [
        _buildServiceCard('Flutter App Development', Icons.phone_android),
        const SizedBox(height: 24),
        _buildServiceCard('UI/UX Design', Icons.design_services),
        const SizedBox(height: 24),
        _buildServiceCard('App Maintenance', Icons.build),
      ],
    );
  }
  
  Widget _buildServiceCard(String title, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(AppDimensions.borderRadiusL),
        border: Border.all(
          color: AppColors.cardBorder,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.secondaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: AppColors.secondaryColor,
              size: 40,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: AppTextStyles.titleStyle.copyWith(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'I provide high-quality ${title.toLowerCase()} services tailored to your specific needs. '
            'From concept to deployment, I ensure a smooth and efficient process.',
            style: AppTextStyles.bodyStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
} 