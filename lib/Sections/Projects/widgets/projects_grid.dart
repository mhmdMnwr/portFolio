import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/constants.dart';
import 'project_card.dart';

class ProjectsGrid extends StatelessWidget {
  const ProjectsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    if (isMobile(context)) {
      return Column(
        children: ProjectsConstants.projects
            .map((project) => Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: ProjectCard(project: project),
                ))
            .toList(),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width > 1200 ? 3 : 2,
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
        childAspectRatio: 0.85,
      ),
      itemCount: ProjectsConstants.projects.length,
      itemBuilder: (context, index) {
        return ProjectCard(project: ProjectsConstants.projects[index]);
      },
    );
  }
}
