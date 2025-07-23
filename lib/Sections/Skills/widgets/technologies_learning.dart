import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/constants.dart';
import 'tech_tag.dart';

class TechnologiesLearning extends StatelessWidget {
  const TechnologiesLearning({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          SkillsConstants.technologiesLearningTitle,
          style: TextStyle(
            color: Colors.white,
            fontSize: isMobile(context) ? 24 : 28,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),

        // First row of technologies
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          children: const [
            TechTag(text: 'Flutter', color: Colors.blue),
            TechTag(text: 'Dart', color: Colors.blue),
            TechTag(text: 'MongoDB', color: Colors.green),
            TechTag(text: 'Node.js', color: Colors.green),
            TechTag(text: 'Firebase', color: Colors.orange),
            TechTag(text: 'Git', color: Colors.grey),
            TechTag(text: 'VS Code', color: Colors.blue),
            TechTag(text: 'REST APIs', color: Colors.purple),
            TechTag(text: 'JSON', color: Colors.yellow),
            TechTag(text: 'Material Design', color: Colors.blue),
          ],
        ),
        const SizedBox(height: 20),

        // Second row of technologies
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          children: const [
            TechTag(text: 'Cupertino', color: Colors.grey),
            TechTag(text: 'State Management', color: Colors.purple),
            TechTag(text: 'Provider', color: Colors.blue),
            TechTag(text: 'Postman', color: Colors.orange),
            TechTag(text: 'GitHub', color: Colors.grey),
            TechTag(text: 'Figma', color: Colors.pink),
            TechTag(text: 'Android Studio', color: Colors.green),
          ],
        ),
      ],
    );
  }
}
