import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/constants.dart';

class ProjectDescription extends StatelessWidget {
  final Map<String, dynamic> project;

  const ProjectDescription({
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
        _buildDescriptionText(),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context) {
    return Text(
      'Project Overview',
      style: TextStyle(
        color: Colors.white,
        fontSize: isMobile(context) ? 24 : 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildDescriptionText() {
    return Text(
      project['description'],
      style: TextStyle(
        color: Colors.grey[300],
        fontSize: 16,
        height: 1.6,
      ),
    );
  }
}
