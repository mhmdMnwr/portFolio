import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/utils/project_assets.dart';

class ProjectImageGallery extends StatefulWidget {
  final Map<String, dynamic> project;

  const ProjectImageGallery({
    super.key,
    required this.project,
  });

  @override
  State<ProjectImageGallery> createState() => _ProjectImageGalleryState();
}

class _ProjectImageGalleryState extends State<ProjectImageGallery> {
  late PageController _pageController;
  int _currentIndex = 0;
  late List<String> _images;

  @override
  void initState() {
    super.initState();
    _images = ProjectAssets.getProjectImages(widget.project['title']);
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.8),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          '${_currentIndex + 1} of ${_images.length}',
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Main image viewer
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: _images.length,
            itemBuilder: (context, index) {
              return Center(
                child: InteractiveViewer(
                  child: Image.asset(
                    _images[index],
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return _buildErrorWidget();
                    },
                  ),
                ),
              );
            },
          ),

          // Navigation arrows (for desktop)
          if (MediaQuery.of(context).size.width > 600) ...[
            // Previous button
            if (_currentIndex > 0)
              Positioned(
                left: 20,
                top: 0,
                bottom: 0,
                child: Center(
                  child: _buildNavigationButton(
                    Icons.chevron_left,
                    () => _previousImage(),
                  ),
                ),
              ),

            // Next button
            if (_currentIndex < _images.length - 1)
              Positioned(
                right: 20,
                top: 0,
                bottom: 0,
                child: Center(
                  child: _buildNavigationButton(
                    Icons.chevron_right,
                    () => _nextImage(),
                  ),
                ),
              ),
          ],

          // Bottom thumbnail bar
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: _buildThumbnailBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationButton(IconData icon, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white, size: 30),
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildThumbnailBar() {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _images.length,
        itemBuilder: (context, index) {
          final isSelected = index == _currentIndex;
          return GestureDetector(
            onTap: () => _goToImage(index),
            child: Container(
              width: 60,
              height: 60,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isSelected ? widget.project['color'] : Colors.white30,
                  width: isSelected ? 3 : 1,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  _images[index],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[800],
                      child: const Icon(
                        Icons.broken_image,
                        color: Colors.white54,
                        size: 20,
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.broken_image,
              color: Colors.white54,
              size: 48,
            ),
            SizedBox(height: 8),
            Text(
              'Image not found',
              style: TextStyle(
                color: Colors.white54,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _previousImage() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _nextImage() {
    if (_currentIndex < _images.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToImage(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
