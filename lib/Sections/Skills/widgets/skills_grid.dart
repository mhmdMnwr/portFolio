import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/constants.dart';
import 'skill_category.dart';

class SkillsGrid extends StatelessWidget {
  final Animation<double> progressAnimation;

  const SkillsGrid({
    super.key,
    required this.progressAnimation,
  });

  @override
  Widget build(BuildContext context) {
    if (isMobile(context)) {
      return Column(
        children: [
          SkillCategory(
            title: SkillsConstants.mobileCategory,
            skills: SkillsConstants.mobileSkills,
            progressAnimation: progressAnimation,
          ),
          const SizedBox(height: 40),
          SkillCategory(
            title: SkillsConstants.backendCategory,
            skills: SkillsConstants.backendSkills,
            progressAnimation: progressAnimation,
          ),
          const SizedBox(height: 40),
          SkillCategory(
            title: SkillsConstants.toolsCategory,
            skills: SkillsConstants.toolsSkills,
            progressAnimation: progressAnimation,
          ),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SkillCategory(
            title: SkillsConstants.mobileCategory,
            skills: SkillsConstants.mobileSkills,
            progressAnimation: progressAnimation,
          ),
        ),
        const SizedBox(width: 40),
        Expanded(
          child: SkillCategory(
            title: SkillsConstants.backendCategory,
            skills: SkillsConstants.backendSkills,
            progressAnimation: progressAnimation,
          ),
        ),
        const SizedBox(width: 40),
        Expanded(
          child: SkillCategory(
            title: SkillsConstants.toolsCategory,
            skills: SkillsConstants.toolsSkills,
            progressAnimation: progressAnimation,
          ),
        ),
      ],
    );
  }
}
