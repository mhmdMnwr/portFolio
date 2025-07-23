import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/constants.dart';
import 'project_header.dart';
import 'project_description.dart';
import 'project_technologies.dart';
import 'project_screenshots.dart';
import 'project_features.dart';

class ProjectDetailContent extends StatelessWidget {
  final Map<String, dynamic> project;

  const ProjectDetailContent({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile(context) ? 20 : 80,
        vertical: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProjectHeader(project: project),
          const SizedBox(height: 40),
          ProjectDescription(project: project),
          const SizedBox(height: 40),
          ProjectTechnologies(project: project),
          const SizedBox(height: 40),
          ProjectScreenshots(project: project),
          const SizedBox(height: 40),
          ProjectFeatures(project: project),
        ],
      ),
    );
  }
}
