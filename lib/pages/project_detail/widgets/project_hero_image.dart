import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/constants.dart';
import 'package:mnwr_portfolio/utils/project_assets.dart';
import 'package:mnwr_portfolio/widgets/project_logo.dart';

class ProjectHeroImage extends StatelessWidget {
  final Map<String, dynamic> project;

  const ProjectHeroImage({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final mainImage = ProjectAssets.getMainScreenshot(project['title']);

    return Container(
      width: double.infinity,
      height: isMobile(context) ? 300 : 500,
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
      child: Stack(
        children: [
          // Background image if available
          if (mainImage != null)
            Positioned.fill(
              child: Opacity(
                opacity: 0.3,
                child: Image.asset(
                  mainImage,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(); // Empty container if image fails
                  },
                ),
              ),
            ),

          // Overlay content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProjectLogo(
                  project: project,
                  size: 120,
                  padding: 20,
                  fontSize: 60,
                ),
                const SizedBox(height: 20),
                _buildCategoryBadge(),
                if (mainImage != null) ...[
                  const SizedBox(height: 30),
                  _buildImagePreview(mainImage),
                ],
              ],
            ),
          ),
        ],
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

  Widget _buildImagePreview(String imagePath) {
    return Container(
      width: 200,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: project['color'].withOpacity(0.5),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: project['color'].withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[800],
              child: Icon(
                Icons.image,
                color: Colors.grey[600],
                size: 40,
              ),
            );
          },
        ),
      ),
    );
  }
}
