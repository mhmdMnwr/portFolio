import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/constants.dart';

class ProjectsSubtitle extends StatelessWidget {
  const ProjectsSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      ProjectsConstants.subtitle,
      style: TextStyle(
        color: Colors.grey[400],
        fontSize: isMobile(context) ? 16 : 18,
        height: 1.6,
      ),
      textAlign: TextAlign.center,
    );
  }
}
