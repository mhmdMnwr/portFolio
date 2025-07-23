import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/constants.dart';

class ProjectsSectionTitle extends StatelessWidget {
  const ProjectsSectionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [
          Colors.blue,
          Colors.purple,
          Colors.pink,
        ],
      ).createShader(bounds),
      child: Text(
        ProjectsConstants.sectionTitle,
        style: TextStyle(
          fontSize: isMobile(context) ? 36 : 48,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
