import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/constants.dart';

class ProjectTechnologies extends StatelessWidget {
  final Map<String, dynamic> project;

  const ProjectTechnologies({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context),
        const SizedBox(height: 16),
        _buildTechnologyChips(),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context) {
    return Text(
      'Technologies Used',
      style: TextStyle(
        color: Colors.white,
        fontSize: isMobile(context) ? 24 : 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildTechnologyChips() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: (project['technologies'] as List<String>)
          .map((tech) => _buildTechnologyChip(tech))
          .toList(),
    );
  }

  Widget _buildTechnologyChip(String technology) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: project['color'].withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: project['color'].withOpacity(0.3),
        ),
      ),
      child: Text(
        technology,
        style: TextStyle(
          color: project['color'],
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
