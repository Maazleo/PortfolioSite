import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/app_constants.dart';
import '../utils/responsive.dart';
import 'social_icon.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.responsiveValue(
          context: context,
          mobileValue: 16,
          desktopValue: 48,
        ),
        vertical: 32,
      ),
      color: AppColors.bgSecondary,
      child: Responsive.isMobile(context)
          ? _buildMobileFooter(context)
          : _buildDesktopFooter(context),
    );
  }
  
  Widget _buildDesktopFooter(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: _buildAboutSection(),
            ),
            const SizedBox(width: 40),
            Expanded(
              flex: 1,
              child: _buildQuickLinksSection(),
            ),
            const SizedBox(width: 40),
            Expanded(
              flex: 1,
              child: _buildContactSection(),
            ),
          ],
        ),
        const SizedBox(height: 32),
        const Divider(
          color: AppColors.cardBorder,
          thickness: 1,
        ),
        const SizedBox(height: 24),
        _buildCopyrightSection(context),
      ],
    );
  }
  
  Widget _buildMobileFooter(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildAboutSection(),
        const SizedBox(height: 32),
        _buildQuickLinksSection(),
        const SizedBox(height: 32),
        _buildContactSection(),
        const SizedBox(height: 32),
        const Divider(
          color: AppColors.cardBorder,
          thickness: 1,
        ),
        const SizedBox(height: 24),
        _buildCopyrightSection(context),
      ],
    );
  }
  
  Widget _buildAboutSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'M',
                  style: AppTextStyles.titleStyle.copyWith(
                    color: AppColors.bgPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'Maaz',
              style: AppTextStyles.titleStyle.copyWith(
                fontSize: 20,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'Flutter developer specializing in creating beautiful and functional mobile applications.',
          style: AppTextStyles.bodyStyle,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            SocialIcon(
              icon: FontAwesomeIcons.github,
              url: SocialLinks.github,
              tooltip: 'GitHub',
              size: 18,
            ),
            const SizedBox(width: 16),
            SocialIcon(
              icon: FontAwesomeIcons.linkedin,
              url: SocialLinks.linkedin,
              tooltip: 'LinkedIn',
              size: 18,
            ),
            const SizedBox(width: 16),
            SocialIcon(
              icon: FontAwesomeIcons.twitter,
              url: SocialLinks.twitter,
              tooltip: 'Twitter',
              size: 18,
            ),
          ],
        ),
      ],
    );
  }
  
  Widget _buildQuickLinksSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Links',
          style: AppTextStyles.titleStyle.copyWith(
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 16),
        _buildFooterLink('Home'),
        _buildFooterLink('About'),
        _buildFooterLink('Projects'),
        _buildFooterLink('Experience'),
        _buildFooterLink('Contact'),
      ],
    );
  }
  
  Widget _buildContactSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact',
          style: AppTextStyles.titleStyle.copyWith(
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 16),
        _buildContactItem(Icons.email, 'your.email@example.com'),
        _buildContactItem(Icons.phone, '+92 123 4567890'),
        _buildContactItem(Icons.location_on, 'Karachi, Pakistan'),
      ],
    );
  }
  
  Widget _buildFooterLink(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {},
        child: Text(
          text,
          style: AppTextStyles.bodyStyle.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
  
  Widget _buildContactItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.secondaryColor,
            size: 16,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: AppTextStyles.bodyStyle.copyWith(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildCopyrightSection(BuildContext context) {
    final currentYear = DateTime.now().year;
    
    return Row(
      mainAxisAlignment: Responsive.isMobile(context)
          ? MainAxisAlignment.center
          : MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '© $currentYear Maaz. All Rights Reserved.',
          style: AppTextStyles.bodyStyle.copyWith(
            color: AppColors.textSecondary,
            fontSize: 14,
          ),
        ),
        if (!Responsive.isMobile(context))
          Text(
            'Designed & Developed with Flutter',
            style: AppTextStyles.bodyStyle.copyWith(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
      ],
    );
  }
} 