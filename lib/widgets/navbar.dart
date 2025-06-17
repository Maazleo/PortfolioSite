import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:ui';
import '../constants/app_constants.dart';
import '../utils/responsive.dart';
import 'animated_button.dart';
import 'social_icon.dart';

class NavBar extends StatefulWidget {
  final Function(int) onNavItemClicked;
  final int currentIndex;
  
  const NavBar({
    Key? key,
    required this.onNavItemClicked,
    required this.currentIndex,
  }) : super(key: key);
  
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool _isMenuOpen = false;
  
  final List<String> _navItems = [
    SectionTitles.home,
    SectionTitles.about,
    SectionTitles.experience,
    SectionTitles.projects,
    SectionTitles.skills,
    SectionTitles.education,
    SectionTitles.achievements,
    SectionTitles.freelancing,
    SectionTitles.contact,
  ];
  
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          color: AppColors.bgPrimary.withOpacity(0.9),
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.responsiveValue(
              context: context,
              mobileValue: 16,
              desktopValue: 24,
            ),
            vertical: 8,
          ),
          child: Responsive.isMobile(context)
              ? _buildMobileNavBar()
              : _buildDesktopNavBar(),
        ),
      ),
    );
  }
  
  Widget _buildDesktopNavBar() {
    final isTablet = Responsive.isTablet(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final showSocialIcons = screenWidth > 1000; // Only show social icons on larger screens
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              _buildLogo(),
              SizedBox(width: isTablet ? 16 : 24),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      _navItems.length,
                      (index) => _buildNavItem(index, isTablet),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showSocialIcons) ...[
              SocialIcon(
                icon: FontAwesomeIcons.github,
                url: SocialLinks.github,
                tooltip: 'GitHub',
                size: 14,
              ),
              const SizedBox(width: 10),
              SocialIcon(
                icon: FontAwesomeIcons.linkedin,
                url: SocialLinks.linkedin,
                tooltip: 'LinkedIn',
                size: 14,
              ),
              const SizedBox(width: 10),
            ],
            AnimatedButton(
              text: 'Resume',
              onPressed: () {},
              isSmall: true,
              icon: Icons.download,
              width: 110,
            ),
          ],
        ),
      ],
    );
  }
  
  Widget _buildMobileNavBar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildLogo(),
            IconButton(
              icon: Icon(
                _isMenuOpen ? Icons.close : Icons.menu,
                color: AppColors.textPrimary,
                size: 24,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {
                setState(() {
                  _isMenuOpen = !_isMenuOpen;
                });
              },
            ),
          ],
        ),
        if (_isMenuOpen) ...[
          const SizedBox(height: 16),
          ...List.generate(
            _navItems.length,
            (index) => _buildMobileNavItem(index),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialIcon(
                icon: FontAwesomeIcons.github,
                url: SocialLinks.github,
                tooltip: 'GitHub',
                size: 16,
              ),
              const SizedBox(width: 16),
              SocialIcon(
                icon: FontAwesomeIcons.linkedin,
                url: SocialLinks.linkedin,
                tooltip: 'LinkedIn',
                size: 16,
              ),
              const SizedBox(width: 16),
              SocialIcon(
                icon: FontAwesomeIcons.twitter,
                url: SocialLinks.twitter,
                tooltip: 'Twitter',
                size: 16,
              ),
            ],
          ),
          const SizedBox(height: 16),
          AnimatedButton(
            text: 'Resume',
            onPressed: () {},
            isSmall: true,
            icon: Icons.download,
          ),
        ],
      ],
    );
  }
  
  Widget _buildLogo() {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Text(
              'M',
              style: AppTextStyles.titleStyle.copyWith(
                color: AppColors.bgPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          'Maaz',
          style: AppTextStyles.titleStyle.copyWith(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
  
  Widget _buildNavItem(int index, bool isTablet) {
    final bool isActive = widget.currentIndex == index;
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isTablet ? 4 : 8),
      child: InkWell(
        onTap: () => widget.onNavItemClicked(index),
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _navItems[index],
                style: AppTextStyles.bodyStyle.copyWith(
                  fontSize: isTablet ? 13 : 15,
                  color: isActive ? AppColors.secondaryColor : AppColors.textSecondary,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
              const SizedBox(height: 2),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 2,
                width: isActive ? 16 : 0,
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildMobileNavItem(int index) {
    final bool isActive = widget.currentIndex == index;
    
    return InkWell(
      onTap: () {
        widget.onNavItemClicked(index);
        setState(() {
          _isMenuOpen = false;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _navItems[index],
              style: AppTextStyles.bodyStyle.copyWith(
                color: isActive ? AppColors.secondaryColor : AppColors.textSecondary,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 