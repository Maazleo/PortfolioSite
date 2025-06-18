import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// App Colors
class AppColors {
  // Primary colors
  static const Color primaryColor = Color(0xFF0A192F); // Dark blue
  static const Color secondaryColor = Color(0xFF64FFDA); // Teal accent
  static const Color accentColor = Color(0xFF8892B0); // Slate
  
  // Background colors
  static const Color bgPrimary = Color(0xFF0A192F); // Dark blue
  static const Color bgSecondary = Color(0xFF112240); // Slightly lighter blue
  
  // Text colors
  static const Color textPrimary = Color(0xFFE6F1FF); // Almost white
  static const Color textSecondary = Color(0xFF8892B0); // Slate
  static const Color textAccent = Color(0xFF64FFDA); // Teal
  
  // Card colors
  static const Color cardBg = Color(0xFF112240); // Slightly lighter blue
  static const Color cardBorder = Color(0xFF1E3A6D); // Border color
}

// Text Styles
class AppTextStyles {
  static TextStyle get headingStyle => GoogleFonts.poppins(
    fontSize: 42,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: 1.1,
  );
  
  static TextStyle get subHeadingStyle => GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );
  
  static TextStyle get titleStyle => GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );
  
  static TextStyle get bodyStyle => GoogleFonts.poppins(
    fontSize: 16,
    color: AppColors.textSecondary,
    height: 1.5,
  );
  
  static TextStyle get buttonTextStyle => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.secondaryColor,
  );
}

// App Dimensions
class AppDimensions {
  static const double paddingS = 8.0;
  static const double paddingM = 16.0;
  static const double paddingL = 24.0;
  static const double paddingXL = 32.0;
  
  static const double borderRadiusS = 4.0;
  static const double borderRadiusM = 8.0;
  static const double borderRadiusL = 12.0;
  
  // Responsive breakpoints
  static const double mobileBreakpoint = 576;
  static const double tabletBreakpoint = 768;
  static const double desktopBreakpoint = 1200;
}

// Section Titles
class SectionTitles {
  static const String home = "Home";
  static const String about = "About Me";
  static const String experience = "Experience";
  static const String projects = "Projects";
  static const String skills = "Skills";
  static const String education = "Education";
  static const String achievements = "Achievements";
  static const String freelancing = "Freelancing";
  static const String contact = "Contact";
}

// Social Media Links
class SocialLinks {
  static const String github = "https://github.com/Maazleo";
  static const String linkedin = "https://www.linkedin.com/in/muhammad-maaz-9b134a251?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app";
  static const String twitter = "https://twitter.com/yourusername";
  static const String fiverr = "https://www.fiverr.com/s/99Q8Dw0";
  static const String upwork = "https://www.upwork.com/yourusername";
  static const String email = "maazmasroorhuss@gmail.com";
}

// Assets Paths
class AssetPaths {
  static const String profileImage = "assets/images/profile.png";
  static const String logoImage = "assets/images/logo.png";
  static const String githubIcon = "assets/icons/github.png";
  static const String linkedinIcon = "assets/icons/linkedin.png";
  static const String twitterIcon = "assets/icons/twitter.svg";
  static const String fiverrIcon = "assets/icons/fiverr.png";
  static const String upworkIcon = "assets/icons/upwork.svg";
  static const String emailIcon = "assets/icons/gmail.png";
} 