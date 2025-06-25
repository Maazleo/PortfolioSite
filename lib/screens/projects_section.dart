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
    final List<Project> flutterProjects = Project.sampleProjects.where((p) => p.category == 'Flutter').toList();
    final List<Project> webProjects = Project.sampleProjects.where((p) => p.category == 'Web').toList();
    final List<Project> featuredFlutter = flutterProjects.take(2).toList();
    final List<Project> otherFlutter = flutterProjects.skip(2).toList();
    final List<Project> featuredWeb = webProjects.isNotEmpty ? [webProjects.first] : <Project>[];
    final List<Project> otherWeb = webProjects.length > 1 ? webProjects.sublist(1) : <Project>[];
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
          // Flutter Apps Section
          Text('Flutter Apps', style: AppTextStyles.titleStyle),
          const SizedBox(height: 24),
          ...featuredFlutter.map<Widget>((project) => Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: ProjectCard(project: project, isMobile: false),
          )).toList(),
          if (otherFlutter.isNotEmpty) ...[
            const SizedBox(height: 24),
            _buildProjectGrid(otherFlutter),
          ],
          const SizedBox(height: 40),
          // Web Apps Section
          Text('React.js & Web Apps', style: AppTextStyles.titleStyle),
          const SizedBox(height: 24),
          ...featuredWeb.map<Widget>((project) => Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: ProjectCard(project: project, isMobile: false),
          )).toList(),
          if (otherWeb.isNotEmpty) ...[
            const SizedBox(height: 24),
            _buildProjectGrid(otherWeb),
          ],
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

  Widget _buildProjectGrid(List<Project> projects) {
    final isMobile = false; // You can add responsive logic if needed
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        childAspectRatio: 0.8,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return _buildProjectGridItem(projects[index]);
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