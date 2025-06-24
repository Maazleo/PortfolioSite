import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_constants.dart';
import '../models/project_model.dart';
import '../utils/responsive.dart';
import '../widgets/section_title.dart';
import '../widgets/animated_button.dart';
import '../widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({Key? key}) : super(key: key);
  
  Future<void> _navigateToGitHub() async {
    const String githubUrl = SocialLinks.github;
    
    if (await canLaunchUrl(Uri.parse(githubUrl))) {
      await launchUrl(Uri.parse(githubUrl), mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $githubUrl';
    }
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
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
            title: SectionTitles.projects,
            subtitle: 'Some of my recent work',
          ),
          _buildFeaturedProjects(context),
          const SizedBox(height: 60),
          _buildOtherProjects(context),
          const SizedBox(height: 40),
          Center(
            child: AnimatedButton(
              text: 'View All Projects',
              onPressed: _navigateToGitHub,
              icon: Icons.apps,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildFeaturedProjects(BuildContext context) {
    final featuredProjects = Project.sampleProjects.where((project) => project.featured).toList();
    final isMobile = Responsive.isMobile(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Featured Projects',
          style: AppTextStyles.titleStyle,
        ),
        const SizedBox(height: 32),
        ...List.generate(featuredProjects.length, (index) {
          return ProjectCard(
            project: featuredProjects[index],
            isReversed: index % 2 == 1,
            isMobile: isMobile,
          );
        }),
      ],
    );
  }
  
  Widget _buildOtherProjects(BuildContext context) {
    final otherProjects = Project.sampleProjects.where((project) => !project.featured).toList();
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Other Noteworthy Projects',
          style: AppTextStyles.titleStyle,
        ),
        const SizedBox(height: 32),
        if (isMobile)
          _buildMobileProjectGrid(otherProjects)
        else if (isTablet)
          _buildTabletProjectGrid(otherProjects)
        else
          _buildDesktopProjectGrid(otherProjects),
      ],
    );
  }
  
  Widget _buildDesktopProjectGrid(List<Project> projects) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        childAspectRatio: 0.8, // Adjusted for better proportions
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return _buildProjectGridItem(projects[index]);
      },
    );
  }
  
  Widget _buildTabletProjectGrid(List<Project> projects) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.85, // Adjusted for better proportions
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return _buildProjectGridItem(projects[index]);
      },
    );
  }
  
  Widget _buildMobileProjectGrid(List<Project> projects) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: _buildProjectGridItem(projects[index]),
        );
      },
    );
  }
  
  Widget _buildProjectGridItem(Project project) {
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
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.folder,
                color: AppColors.secondaryColor,
                size: 40,
              ),
              Row(
                children: [
                  if (project.liveUrl != null)
                    AnimatedButton(
                      text: 'Live Demo',
                      onPressed: () => _launchURL(project.liveUrl!),
                      icon: Icons.language,
                      isSmall: true,
                      isOutlined: true,
                    ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(
                      Icons.code,
                      color: AppColors.textSecondary,
                    ),
                    onPressed: () => _launchURL(project.githubUrl),
                    tooltip: 'Source Code',
                    constraints: const BoxConstraints(),
                    padding: const EdgeInsets.all(8),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            project.title,
            style: AppTextStyles.titleStyle.copyWith(
              fontSize: 20,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Text(
              project.description,
              style: AppTextStyles.bodyStyle,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: project.technologies.map((tech) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
} 