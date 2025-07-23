import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/constants.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    if (isMobile(context)) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatItem('🎓', 'École Supérieure\nd\'Informatique'),
              _buildStatItem('👨‍💻', '2 Years Learning'),
            ],
          ),
          const SizedBox(height: 30),
          _buildStatItem('📱', '4 Apps Built'),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatItem('🎓', 'École Supérieure d\'Informatique'),
        _buildStatItem('📱', '4 Apps Built'),
        _buildStatItem('👨‍💻', '2 Years Learning'),
      ],
    );
  }

  Widget _buildStatItem(String icon, String text) {
    return Column(
      children: [
        Text(
          icon,
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 8),
        Text(
          text,
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
