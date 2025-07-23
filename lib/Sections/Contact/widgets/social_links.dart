import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constants.dart';

class SocialLinks extends StatefulWidget {
  const SocialLinks({super.key});

  @override
  State<SocialLinks> createState() => _SocialLinksState();
}

class _SocialLinksState extends State<SocialLinks> {
  int _hoveredIndex = -1;

  final List<SocialLink> _socialLinks = [
    SocialLink(
      name: 'GitHub',
      url: ContactConstants.githubUrl,
      icon: Icons.code,
      color: const Color(0xFF181717),
    ),
    SocialLink(
      name: 'LinkedIn',
      url: ContactConstants.linkedinUrl,
      icon: Icons.business,
      color: const Color(0xFF0A66C2),
    ),
    SocialLink(
      name: 'Facebook',
      url: ContactConstants.facebookUrl,
      icon: Icons.facebook,
      color: const Color(0xFF1877F2),
    ),
  ];

  void _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Could not launch $url'),
              duration: const Duration(seconds: 2),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error opening $url'),
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          ContactConstants.socialTitle,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryText,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          ContactConstants.socialDescription,
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.secondaryText,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: _socialLinks.asMap().entries.map((entry) {
            final index = entry.key;
            final link = entry.value;
            return _buildSocialButton(link, index);
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSocialButton(SocialLink link, int index) {
    final isHovered = _hoveredIndex == index;

    return MouseRegion(
      onEnter: (_) => setState(() => _hoveredIndex = index),
      onExit: (_) => setState(() => _hoveredIndex = -1),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        transform: Matrix4.identity()..scale(isHovered ? 1.05 : 1.0),
        child: InkWell(
          onTap: () => _launchUrl(link.url),
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: isHovered
                  ? link.color.withOpacity(0.1)
                  : AppColors.cardBackground,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isHovered
                    ? link.color.withOpacity(0.3)
                    : AppColors.secondaryText.withOpacity(0.1),
                width: 2,
              ),
              boxShadow: isHovered
                  ? [
                      BoxShadow(
                        color: link.color.withOpacity(0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ]
                  : [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isHovered ? link.color : link.color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    link.icon,
                    size: 32,
                    color: isHovered ? Colors.white : link.color,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  link.name,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isHovered ? link.color : AppColors.primaryText,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SocialLink {
  final String name;
  final String url;
  final IconData icon;
  final Color color;

  SocialLink({
    required this.name,
    required this.url,
    required this.icon,
    required this.color,
  });
}
