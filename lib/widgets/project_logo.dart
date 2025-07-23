import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/utils/project_assets.dart';

class ProjectLogo extends StatelessWidget {
  final Map<String, dynamic> project;
  final double size;
  final double padding;
  final double fontSize;

  const ProjectLogo({
    super.key,
    required this.project,
    this.size = 50,
    this.padding = 12,
    this.fontSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    final logoPath = ProjectAssets.getProjectLogo(project['title']);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: project['color'].withOpacity(0.1),
        borderRadius: BorderRadius.circular(
            size * 0.24), // 24% of size for proper rounding
        border: Border.all(
          color: project['color'].withOpacity(0.3),
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(size * 0.22), // Slightly smaller for border
        child: logoPath != null
            ? Padding(
                padding: EdgeInsets.all(padding),
                child: Image.asset(
                  logoPath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return _buildFallbackIcon();
                  },
                ),
              )
            : _buildFallbackIcon(),
      ),
    );
  }

  Widget _buildFallbackIcon() {
    return Center(
      child: Text(
        project['icon'],
        style: TextStyle(
          fontSize: fontSize,
          color: project['color'],
        ),
      ),
    );
  }
}
