import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/constants.dart';

class ProjectFeatures extends StatelessWidget {
  final Map<String, dynamic> project;

  const ProjectFeatures({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final features = _getProjectFeatures();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context),
        const SizedBox(height: 16),
        _buildFeaturesList(features),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context) {
    return Text(
      'Key Features',
      style: TextStyle(
        color: Colors.white,
        fontSize: isMobile(context) ? 24 : 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildFeaturesList(List<String> features) {
    return Column(
      children: features.map((feature) => _buildFeatureItem(feature)).toList(),
    );
  }

  Widget _buildFeatureItem(String feature) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBulletPoint(),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              feature,
              style: TextStyle(
                color: Colors.grey[300],
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletPoint() {
    return Container(
      width: 6,
      height: 6,
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: project['color'],
        shape: BoxShape.circle,
      ),
    );
  }

  List<String> _getProjectFeatures() {
    switch (project['title']) {
      case 'Easy Home':
        return [
          'Browse available craftsmen in your area',
          'Real-time location-based search',
          'Secure messaging between clients and craftsmen',
          'Job posting and proposal system',
          'Rating and review system',
          'In-app payment integration',
        ];
      case 'Madrassat Iqraa':
        return [
          'Student and teacher registration system',
          'Class scheduling and management',
          'Financial transaction tracking',
          'Progress monitoring and reporting',
          'Digital attendance system',
          'Parent-teacher communication portal',
        ];
      case 'Dirassaty':
        return [
          'Real-time grade tracking',
          'Academic calendar integration',
          'Parent-teacher messaging',
          'Assignment and homework tracking',
          'Attendance monitoring',
          'Performance analytics and reports',
        ];
      case 'Prayer Time':
        return [
          'Accurate prayer times based on location',
          'Qibla direction compass',
          'Daily adhkar and Islamic content',
          'Prayer time notifications',
          'Islamic calendar integration',
          'Customizable prayer reminders',
        ];
      case 'Portfolio Website':
        return [
          'Responsive design for all devices',
          'Smooth animations and transitions',
          'Modern UI/UX design principles',
          'Performance optimized',
          'Clean and maintainable code structure',
          'Cross-platform compatibility',
        ];
      default:
        return ['Feature 1', 'Feature 2', 'Feature 3'];
    }
  }
}
