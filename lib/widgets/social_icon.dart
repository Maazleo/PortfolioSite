import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_constants.dart';

class SocialIcon extends StatefulWidget {
  final IconData icon;
  final String url;
  final String tooltip;
  final double size;
  
  const SocialIcon({
    Key? key,
    required this.icon,
    required this.url,
    required this.tooltip,
    this.size = 24,
  }) : super(key: key);
  
  @override
  State<SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<SocialIcon> {
  bool _isHovered = false;
  
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Tooltip(
        message: widget.tooltip,
        child: InkWell(
          onTap: () => _launchURL(widget.url),
          borderRadius: BorderRadius.circular(50),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: _isHovered ? AppColors.secondaryColor : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: _isHovered ? AppColors.secondaryColor : AppColors.textSecondary,
                width: 1.5,
              ),
            ),
            child: Icon(
              widget.icon,
              color: _isHovered ? AppColors.bgPrimary : AppColors.textSecondary,
              size: widget.size,
            ),
          ),
        ),
      ),
    );
  }
  
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
} 