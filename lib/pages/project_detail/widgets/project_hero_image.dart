import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/constants.dart';

class ProjectHeroImage extends StatelessWidget {
  final Map<String, dynamic> project;

  const ProjectHeroImage({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: isMobile(context) ? 250 : 400,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            project['color'].withOpacity(0.3),
            project['color'].withOpacity(0.1),
            const Color(0xFF1a1a2e),
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildIconContainer(),
            const SizedBox(height: 20),
            _buildCategoryBadge(),
          ],
        ),
      ),
    );
  }

  Widget _buildIconContainer() {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: project['color'].withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          project['icon'],
          style: const TextStyle(fontSize: 60),
        ),
      ),
    );
  }

  Widget _buildCategoryBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: project['color'].withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: project['color'].withOpacity(0.5),
        ),
      ),
      child: Text(
        project['category'],
        style: TextStyle(
          color: project['color'],
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
