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
              _buildStatItem('🎓', HeroConstants.schoolStatMobile),
              _buildStatItem('👨‍💻', HeroConstants.experienceStat),
            ],
          ),
          const SizedBox(height: 30),
          _buildStatItem('📱', HeroConstants.appsStat),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatItem('🎓', HeroConstants.schoolStat),
        _buildStatItem('📱', HeroConstants.appsStat),
        _buildStatItem('👨‍💻', HeroConstants.experienceStat),
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
