import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/constants.dart';
import 'package:mnwr_portfolio/utils/project_assets.dart';

class ProjectScreenshots extends StatelessWidget {
  final Map<String, dynamic> project;

  const ProjectScreenshots({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final images = ProjectAssets.getProjectImages(project['title']);

    if (images.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Screenshots',
          style: TextStyle(
            color: Colors.white,
            fontSize: isMobile(context) ? 24 : 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        _buildImageGrid(context, images),
      ],
    );
  }

  Widget _buildImageGrid(BuildContext context, List<String> images) {
    final crossAxisCount = isMobile(context) ? 2 : 3;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.6,
      ),
      itemCount: images.length > 6 ? 6 : images.length, // Limit to 6 images
      itemBuilder: (context, index) {
        return _buildImageItem(context, images[index], index);
      },
    );
  }

  Widget _buildImageItem(BuildContext context, String imagePath, int index) {
    return GestureDetector(
      onTap: () => _showImageDialog(context, imagePath),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.white.withOpacity(0.1),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[800],
                child: const Center(
                  child: Icon(
                    Icons.image_not_supported,
                    color: Colors.grey,
                    size: 40,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _showImageDialog(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.8,
              maxHeight: MediaQuery.of(context).size.height * 0.8,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[800],
                    child: const Center(
                      child: Text(
                        'Image not found',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
