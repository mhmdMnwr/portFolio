import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/constants.dart';

class ProjectScreenshots extends StatelessWidget {
  final Map<String, dynamic> project;

  const ProjectScreenshots({
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
        _buildScreenshotsGrid(context),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context) {
    return Text(
      'Screenshots',
      style: TextStyle(
        color: Colors.white,
        fontSize: isMobile(context) ? 24 : 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildScreenshotsGrid(BuildContext context) {
    if (isMobile(context)) {
      return _buildMobileLayout();
    } else {
      return _buildDesktopLayout();
    }
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        DummyScreenshot(number: 1),
        const SizedBox(height: 16),
        DummyScreenshot(number: 2),
        const SizedBox(height: 16),
        DummyScreenshot(number: 3),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      children: [
        Expanded(child: DummyScreenshot(number: 1)),
        const SizedBox(width: 16),
        Expanded(child: DummyScreenshot(number: 2)),
        const SizedBox(width: 16),
        Expanded(child: DummyScreenshot(number: 3)),
      ],
    );
  }
}

class DummyScreenshot extends StatelessWidget {
  final int number;

  const DummyScreenshot({
    super.key,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.image,
              color: Colors.grey[600],
              size: 48,
            ),
            const SizedBox(height: 8),
            Text(
              'Screenshot $number',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Coming Soon',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
