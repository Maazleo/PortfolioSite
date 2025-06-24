import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/app_constants.dart';
import '../utils/responsive.dart';
import '../widgets/animated_button.dart';
import '../widgets/social_icon.dart';

class HomeSection extends StatelessWidget {
  final Function() onExploreClicked;
  final Function() onContactClicked;
  
  const HomeSection({
    Key? key,
    required this.onExploreClicked,
    required this.onContactClicked,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Responsive.getScreenHeight(context),
      width: double.infinity,
      padding: Responsive.responsivePadding(context: context),
      child: Center(
        child: Responsive.isMobile(context)
            ? _buildMobileContent(context)
            : _buildDesktopContent(context),
      ),
    );
  }
  
  Widget _buildDesktopContent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildGreeting(),
              const SizedBox(height: 24),
              _buildName(context),
              const SizedBox(height: 16),
              _buildRole(context),
              const SizedBox(height: 24),
              _buildDescription(context),
              const SizedBox(height: 40),
              _buildButtons(context),
              const SizedBox(height: 48),
              _buildSocialIcons(),
            ],
          ),
        ),
        const SizedBox(width: 80),
        Expanded(
          child: _buildProfileImage(context),
        ),
      ],
    );
  }
  
  Widget _buildMobileContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildProfileImage(context, isMobile: true),
        const SizedBox(height: 40),
        _buildGreeting(),
        const SizedBox(height: 16),
        _buildName(context, isMobile: true),
        const SizedBox(height: 12),
        _buildRole(context, isMobile: true),
        const SizedBox(height: 24),
        _buildDescription(context, isMobile: true),
        const SizedBox(height: 32),
        _buildButtons(context),
        const SizedBox(height: 32),
        _buildSocialIcons(),
      ],
    );
  }
  
  Widget _buildGreeting() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 1,
          width: 40,
          color: AppColors.secondaryColor,
        ),
        const SizedBox(width: 12),
        Text(
          "Hello, I'm",
          style: AppTextStyles.bodyStyle.copyWith(
            color: AppColors.secondaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
  
  Widget _buildName(BuildContext context, {bool isMobile = false}) {
    return Text(
      'Maaz Hussain',
      style: isMobile
          ? AppTextStyles.headingStyle.copyWith(fontSize: 36)
          : AppTextStyles.headingStyle,
    );
  }
  
  Widget _buildRole(BuildContext context, {bool isMobile = false}) {
    return SizedBox(
      width: isMobile ? double.infinity : 400,
      child: DefaultTextStyle(
        style: isMobile
            ? AppTextStyles.subHeadingStyle.copyWith(fontSize: 24)
            : AppTextStyles.subHeadingStyle,
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'Flutter Mobile APP Developer',
              speed: const Duration(milliseconds: 100),
              cursor: '|',
            ),
            TypewriterAnimatedText(
              'React.js Developer',
              speed: const Duration(milliseconds: 100),
              cursor: '|',
            ),
            TypewriterAnimatedText(
              'Fiverr Freelancer',
              speed: const Duration(milliseconds: 100),
              cursor: '|',
            ),
            TypewriterAnimatedText(
              'Mobile and Web App Enthusiast',
              speed: const Duration(milliseconds: 100),
              cursor: '|',
            ),
          ],
          repeatForever: true,
          pause: const Duration(milliseconds: 1000),
        ),
      ),
    );
  }
  
  Widget _buildDescription(BuildContext context, {bool isMobile = false}) {
    return SizedBox(
      width: isMobile ? double.infinity : 500,
      child: Text(
        'I design and develop Softwares, Mobile Applications using Flutter and Websites with React.Js. '
        'Specializing in creating beautiful, responsive, and user-friendly applications and web Apps '
        'that provide exceptional user experiences across all platforms.',
        style: AppTextStyles.bodyStyle,
      ),
    );
  }
  
  Widget _buildButtons(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: [
        AnimatedButton(
          text: 'Explore My Work',
          onPressed: onExploreClicked,
          icon: Icons.arrow_downward,
        ),
        AnimatedButton(
          text: 'Contact Me',
          onPressed: onContactClicked,
          isPrimary: false,
          icon: Icons.email,
        ),
      ],
    );
  }
  
  Widget _buildSocialIcons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SocialIcon(
          icon: FontAwesomeIcons.github,
          url: "https://github.com/Maazleo",
          tooltip: 'GitHub',
        ),
        const SizedBox(width: 16),
        SocialIcon(
          icon: FontAwesomeIcons.linkedin,
          url: "https://www.linkedin.com/in/muhammad-maaz-9b134a251",
          tooltip: 'LinkedIn',
        ),
        const SizedBox(width: 16),
        SocialIcon(
          icon: FontAwesomeIcons.facebook,
          url: "https://www.facebook.com/maazhun",
          tooltip: 'Facebook',
        ),
        const SizedBox(width: 16),
        SocialIcon(
          icon: FontAwesomeIcons.upwork,
          url: 'https://www.fiverr.com/s/99Q8Dw0',
          tooltip: 'Fiverr',
        ),
      ],
    );
  }
  
  Widget _buildProfileImage(BuildContext context, {bool isMobile = false}) {
    final size = isMobile
        ? Responsive.getScreenWidth(context) * 0.6
        : Responsive.getScreenWidth(context) * 0.3;
        
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.secondaryColor.withOpacity(0.3),
            blurRadius: 30,
            spreadRadius: 10,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size / 2),
        child: Image.asset(
          AssetPaths.profileImage,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: AppColors.bgSecondary,
              child: Center(
                child: Icon(
                  Icons.person,
                  color: AppColors.textSecondary,
                  size: size / 3,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
} 