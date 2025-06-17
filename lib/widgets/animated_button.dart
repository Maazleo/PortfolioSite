import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants/app_constants.dart';

class AnimatedButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;
  final bool isSmall;
  final IconData? icon;
  final bool isOutlined;
  final double? width;

  const AnimatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
    this.isSmall = false,
    this.icon,
    this.isOutlined = false,
    this.width,
  }) : super(key: key);

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: widget.width,
          padding: EdgeInsets.symmetric(
            horizontal: widget.isSmall ? 16 : 24,
            vertical: widget.isSmall ? 8 : 12,
          ),
          decoration: BoxDecoration(
            color: _getBackgroundColor(),
            borderRadius: BorderRadius.circular(AppDimensions.borderRadiusM),
            border: Border.all(
              color: AppColors.secondaryColor,
              width: 1.5,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: AppColors.secondaryColor.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    )
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: widget.width != null ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: [
              if (widget.icon != null) ...[
                Icon(
                  widget.icon,
                  color: _getTextColor(),
                  size: widget.isSmall ? 16 : 20,
                ),
                SizedBox(width: widget.isSmall ? 8 : 12),
              ],
              Text(
                widget.text,
                style: AppTextStyles.buttonTextStyle.copyWith(
                  fontSize: widget.isSmall ? 14 : 16,
                  color: _getTextColor(),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        )
            .animate(target: _isHovered ? 1 : 0)
            .scale(
              begin: const Offset(1, 1),
              end: const Offset(1.03, 1.03),
              duration: 200.ms,
            )
            .moveY(
              begin: 0,
              end: -2,
              duration: 200.ms,
            ),
      ),
    );
  }

  Color _getBackgroundColor() {
    if (widget.isOutlined) {
      return _isHovered ? AppColors.secondaryColor.withOpacity(0.1) : Colors.transparent;
    }
    
    if (widget.isPrimary) {
      return _isHovered ? AppColors.secondaryColor : Colors.transparent;
    } else {
      return _isHovered ? AppColors.bgSecondary : Colors.transparent;
    }
  }

  Color _getTextColor() {
    if (widget.isOutlined) {
      return AppColors.secondaryColor;
    }
    
    if (widget.isPrimary) {
      return _isHovered ? AppColors.bgPrimary : AppColors.secondaryColor;
    } else {
      return AppColors.textPrimary;
    }
  }
} 