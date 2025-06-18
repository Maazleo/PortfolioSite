import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/app_constants.dart';
import '../utils/responsive.dart';
import '../widgets/section_title.dart';
import '../widgets/animated_button.dart';
import '../widgets/social_icon.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({Key? key}) : super(key: key);

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
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
            title: SectionTitles.contact,
            subtitle: 'Get in touch with me',
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
          flex: 1,
          child: _buildContactInfo(context),
        ),
        const SizedBox(width: 60),
        Expanded(
          flex: 2,
          child: _buildContactForm(context),
        ),
      ],
    );
  }

  Widget _buildMobileContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContactInfo(context),
        const SizedBox(height: 40),
        _buildContactForm(context),
      ],
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Information',
          style: AppTextStyles.titleStyle,
        ),
        const SizedBox(height: 24),
        _buildContactItem(
          icon: Icons.email,
          title: 'Email',
          content: 'maazmasroorhuss@gmail.com',
          onTap: () {},
        ),
        _buildContactItem(
          icon: Icons.phone,
          title: 'Phone',
          content: '+92 305 5248609',
          onTap: () {},
        ),
        _buildContactItem(
          icon: Icons.location_on,
          title: 'Location',
          content: 'Lahore, Pakistan',
          onTap: () {},
        ),
        const SizedBox(height: 32),
        Text(
          'Follow Me',
          style: AppTextStyles.titleStyle.copyWith(
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 16),
        Row(
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
              icon: FontAwesomeIcons.instagram,
              url: '',
              tooltip: 'Instagram',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String title,
    required String content,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: InkWell(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.secondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: AppColors.secondaryColor,
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.bodyStyle.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  content,
                  style: AppTextStyles.bodyStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(AppDimensions.borderRadiusL),
        border: Border.all(
          color: AppColors.cardBorder,
          width: 1,
        ),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Send Me a Message',
              style: AppTextStyles.titleStyle,
            ),
            const SizedBox(height: 24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildTextField(
                    controller: _nameController,
                    label: 'Name',
                    hint: 'Enter your name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildTextField(
                    controller: _emailController,
                    label: 'Email',
                    hint: 'Enter your email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildTextField(
              controller: _subjectController,
              label: 'Subject',
              hint: 'Enter subject',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a subject';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            _buildTextField(
              controller: _messageController,
              label: 'Message',
              hint: 'Enter your message',
              maxLines: 5,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a message';
                }
                return null;
              },
            ),
            const SizedBox(height: 32),
            Center(
              child: AnimatedButton(
                text: 'Send Message',
                onPressed: _submitForm,
                width: 180,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.bodyStyle.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          validator: validator,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTextStyles.bodyStyle.copyWith(
              color: AppColors.textSecondary.withOpacity(0.5),
            ),
            filled: true,
            fillColor: AppColors.bgPrimary,
            contentPadding: const EdgeInsets.all(16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimensions.borderRadiusM),
              borderSide: const BorderSide(
                color: AppColors.cardBorder,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimensions.borderRadiusM),
              borderSide: const BorderSide(
                color: AppColors.cardBorder,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimensions.borderRadiusM),
              borderSide: const BorderSide(
                color: AppColors.secondaryColor,
                width: 1,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimensions.borderRadiusM),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1,
              ),
            ),
          ),
          style: AppTextStyles.bodyStyle,
        ),
      ],
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Handle form submission
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Thank you for your message! I\'ll get back to you soon.'),
          backgroundColor: AppColors.secondaryColor,
        ),
      );
      
      // Clear form
      _nameController.clear();
      _emailController.clear();
      _subjectController.clear();
      _messageController.clear();
    }
  }
} 