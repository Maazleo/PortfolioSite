import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_constants.dart';
import '../models/project_model.dart';
import 'animated_button.dart';

class ProjectCard extends StatefulWidget {
  final Project project;
  final bool isReversed;
  final bool isMobile;

  const ProjectCard({
    Key? key,
    required this.project,
    this.isReversed = false,
    this.isMobile = false,
  }) : super(key: key);

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return widget.isMobile
        ? _buildMobileCard()
        : _buildDesktopCard();
  }

  Widget _buildDesktopCard() {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        margin: const EdgeInsets.only(bottom: 80),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (!widget.isReversed) _buildImageSection(),
            SizedBox(width: widget.isReversed ? 0 : 40),
            Expanded(child: _buildContentSection()),
            SizedBox(width: widget.isReversed ? 40 : 0),
            if (widget.isReversed) _buildImageSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMobileImageSection(),
          const SizedBox(height: 20),
          _buildContentSection(),
        ],
      ),
    );
  }

  Widget _buildImageSection() {
    return Expanded(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 300),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.borderRadiusL),
              boxShadow: [
                BoxShadow(
                  color: AppColors.secondaryColor.withOpacity(0.2),
                  blurRadius: _isHovered ? 12 : 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppDimensions.borderRadiusL),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      widget.project.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: AppColors.bgSecondary,
                          child: Center(
                            child: Icon(
                              Icons.image,
                              color: AppColors.textSecondary,
                              size: 48,
                            ),
                          ),
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          color: AppColors.bgSecondary,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColors.secondaryColor,
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded / 
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned.fill(
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: _isHovered ? 0.9 : 0,
                      child: Container(
                        color: AppColors.primaryColor.withOpacity(0.8),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (widget.project.liveUrl != null)
                                IconButton(
                                  icon: const Icon(Icons.language, color: AppColors.secondaryColor),
                                  onPressed: () => _launchURL(widget.project.liveUrl!),
                                  tooltip: 'Visit Live Site',
                                ),
                              const SizedBox(width: 16),
                              IconButton(
                                icon: const FaIcon(FontAwesomeIcons.github, color: AppColors.secondaryColor),
                                onPressed: () => _launchURL(widget.project.githubUrl),
                                tooltip: 'View Source Code',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileImageSection() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 200),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimensions.borderRadiusL),
            boxShadow: [
              BoxShadow(
                color: AppColors.secondaryColor.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppDimensions.borderRadiusL),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    widget.project.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: AppColors.bgSecondary,
                        child: Center(
                          child: Icon(
                            Icons.image,
                            color: AppColors.textSecondary,
                            size: 48,
                          ),
                        ),
                      );
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        color: AppColors.bgSecondary,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.secondaryColor,
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded / 
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    color: AppColors.primaryColor.withOpacity(0.8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (widget.project.liveUrl != null)
                          IconButton(
                            icon: const Icon(Icons.language, color: AppColors.secondaryColor, size: 20),
                            onPressed: () => _launchURL(widget.project.liveUrl!),
                            tooltip: 'Visit Live Site',
                            constraints: const BoxConstraints(),
                            padding: const EdgeInsets.all(8),
                          ),
                        const SizedBox(width: 8),
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.github, color: AppColors.secondaryColor, size: 20),
                          onPressed: () => _launchURL(widget.project.githubUrl),
                          tooltip: 'View Source Code',
                          constraints: const BoxConstraints(),
                          padding: const EdgeInsets.all(8),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContentSection() {
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
            widget.project.title,
            style: AppTextStyles.titleStyle,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          const SizedBox(height: 12),
          Text(
            widget.project.description,
            style: AppTextStyles.bodyStyle,
            maxLines: widget.isMobile ? 3 : null,
            overflow: widget.isMobile ? TextOverflow.ellipsis : TextOverflow.visible,
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: widget.project.technologies.map((tech) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppDimensions.borderRadiusS),
                  border: Border.all(
                    color: AppColors.secondaryColor.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Text(
                  tech,
                  style: AppTextStyles.bodyStyle.copyWith(
                    color: AppColors.secondaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AnimatedButton(
                  text: 'View Project',
                  onPressed: () => _launchURL(widget.project.githubUrl),
                  icon: FontAwesomeIcons.github,
                  isSmall: true,
                ),
                if (widget.project.liveUrl != null) ...[
                  const SizedBox(width: 16),
                  AnimatedButton(
                    text: 'Live Demo',
                    onPressed: () => _launchURL(widget.project.liveUrl!),
                    icon: Icons.language,
                    isSmall: true,
                    isOutlined: true,
                  ),
                ],
              ],
            ),
          ),
        ],
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
