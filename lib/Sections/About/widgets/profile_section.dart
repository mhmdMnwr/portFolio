import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/constants.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Profile Picture
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Colors.blue.withOpacity(0.8),
                Colors.purple.withOpacity(0.8),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.3),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: const Center(
            child: Icon(
              Icons.person,
              size: 80,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 30),

        // Name and Title
        Text(
          'Ameur Mohammed Menouer',
          style: TextStyle(
            color: Colors.white,
            fontSize: isMobile(context) ? 20 : 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 15),

        // Details
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildDetailItem(Icons.calendar_today, '2+ Years'),
            const SizedBox(width: 30),
            _buildDetailItem(Icons.school, 'ESI Student'),
          ],
        ),
        const SizedBox(height: 20),

        // Skill Tags
        Wrap(
          spacing: 10,
          runSpacing: 10,
          alignment: WrapAlignment.center,
          children: [
            _buildSkillTag('Flutter Enthusiast'),
            _buildSkillTag('MongoDB'),
            _buildSkillTag('Learning'),
          ],
        ),
      ],
    );
  }

  Widget _buildDetailItem(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: Colors.grey[400],
          size: 16,
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildSkillTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.blue.withOpacity(0.5)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.blue,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
