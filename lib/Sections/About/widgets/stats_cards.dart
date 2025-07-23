import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/constants.dart';

class StatsCards extends StatelessWidget {
  const StatsCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatCard(
          icon: Icons.code,
          number: '4 Apps',
          label: 'Built',
          color: Colors.blue,
          context: context,
        ),
        const SizedBox(width: 20),
        _buildStatCard(
          icon: Icons.school,
          number: '2 Years',
          label: 'Learning',
          color: Colors.purple,
          context: context,
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String number,
    required String label,
    required Color color,
    required BuildContext context,
  }) {
    return Container(
      width: isMobile(context) ? 120 : 140,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: color,
              size: 24,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            number,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
