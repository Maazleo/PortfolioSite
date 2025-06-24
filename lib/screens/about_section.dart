import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_constants.dart';
import '../utils/responsive.dart';
import '../widgets/section_title.dart';
import '../widgets/animated_button.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);
  
  Future<void> _downloadCV() async {
    // Replace this URL with your actual CV file URL
    // You can host your CV on GitHub, Google Drive, or any other file hosting service
    const String cvUrl = 'https://drive.google.com/file/d/1Qji5oICSDQQCflESRbn-bsfIlbMhL0y2/view?usp=drive_link';
    
    if (await canLaunchUrl(Uri.parse(cvUrl))) {
      await launchUrl(Uri.parse(cvUrl), mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $cvUrl';
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
            title: SectionTitles.about,
            subtitle: 'Get to know me better',
          ),
          Responsive.isMobile(context)
              ? _buildMobileContent(context)
              : _buildDesktopContent(context),
        ],
      ),
    );
  }
  
  Widget _buildDesktopContent(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: _buildAboutText(context),
        ),
        const SizedBox(width: 60),
        Expanded(
          flex: 2,
          child: _buildPersonalInfo(context),
        ),
      ],
    );
  }
  
  Widget _buildMobileContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildAboutText(context),
        const SizedBox(height: 40),
        _buildPersonalInfo(context),
      ],
    );
  }
  
  Widget _buildAboutText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Who am I?',
          style: AppTextStyles.titleStyle,
        ),
        const SizedBox(height: 24),
        Text(
          'I am a passionate Software Developer with over 3 years of experience in building '
          'high-quality mobile applications with Flutter and React-Native and Web Apps with React.js, JavaScript, HTML, Css along with Python. I specialize in creating cross-platform applications '
          'that work seamlessly on both Android and iOS platforms.',
          style: AppTextStyles.bodyStyle,
        ),
        const SizedBox(height: 16),
        Text(
          'My journey in mobile development began when I discovered Flutter in 2023, and I was '
          'immediately captivated by its capabilities. I have been empowering myself towards learning other Languages, Frameworks and Tools like Python,Sql,Sqa and Django',
          style: AppTextStyles.bodyStyle,
        ),
        const SizedBox(height: 16),
        Text(
          'I am passionate about creating intuitive user interfaces and providing exceptional user '
          'experiences. My goal is to build applications that not only look great but also perform '
          'flawlessly across all platforms.',
          style: AppTextStyles.bodyStyle,
        ),
        const SizedBox(height: 24),
        AnimatedButton(
          text: 'Download CV',
          onPressed: _downloadCV,
          icon: Icons.download,
        ),
      ],
    );
  }
  
  Widget _buildPersonalInfo(BuildContext context) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Personal Information',
            style: AppTextStyles.titleStyle.copyWith(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 24),
          _buildInfoItem('Name', 'Muhammad Maaz Hussain'),
          _buildInfoItem('Age', '23 years'),
          _buildInfoItem('Residence', 'Lahore, Pakistan'),
          _buildInfoItem('Email', 'maazmasroorhuss@gmail.com'),
          _buildInfoItem('Phone', '+92 305 5248609'),
          _buildInfoItem('Freelance', 'Available'),
          const SizedBox(height: 24),
          Text(
            'Languages',
            style: AppTextStyles.titleStyle.copyWith(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 16),
          _buildLanguageItem('English', 0.9),
          _buildLanguageItem('Urdu', 1.0),
        ],
      ),
    );
  }
  
  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: AppTextStyles.bodyStyle.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            ':',
            style: AppTextStyles.bodyStyle,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: AppTextStyles.bodyStyle,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildLanguageItem(String language, double proficiency) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                language,
                style: AppTextStyles.bodyStyle.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '${(proficiency * 100).toInt()}%',
                style: AppTextStyles.bodyStyle.copyWith(
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Stack(
            children: [
              Container(
                height: 6,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.bgPrimary,
                  borderRadius: BorderRadius.circular(AppDimensions.borderRadiusS),
                ),
              ),
              Container(
                height: 6,
                width: 300 * proficiency,
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.circular(AppDimensions.borderRadiusS),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
} 