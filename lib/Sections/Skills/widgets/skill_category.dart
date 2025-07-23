import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/constants.dart';
import 'skill_item.dart';

class SkillCategory extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> skills;
  final Animation<double> progressAnimation;

  const SkillCategory({
    super.key,
    required this.title,
    required this.skills,
    required this.progressAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.blue,
              fontSize: isMobile(context) ? 18 : 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          ...skills.map((skill) => SkillItem(
                name: skill['name'],
                level: skill['level'],
                color: skill['color'],
                progressAnimation: progressAnimation,
              )),
        ],
      ),
    );
  }
}
