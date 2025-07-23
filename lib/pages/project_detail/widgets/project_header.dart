import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/constants.dart';

class ProjectHeader extends StatelessWidget {
  final Map<String, dynamic> project;

  const ProjectHeader({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(context),
        const SizedBox(height: 16),
        _buildMetadata(),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      project['title'],
      style: TextStyle(
        color: Colors.white,
        fontSize: isMobile(context) ? 32 : 42,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildMetadata() {
    return Row(
      children: [
        _buildMetadataItem(
          Icons.calendar_today,
          'Completed 2024',
        ),
        const SizedBox(width: 20),
        _buildMetadataItem(
          Icons.devices,
          'Mobile App',
        ),
      ],
    );
  }

  Widget _buildMetadataItem(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: Colors.grey[400],
          size: 16,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
