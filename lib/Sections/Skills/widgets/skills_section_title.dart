import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/constants.dart';

class SkillsSectionTitle extends StatelessWidget {
  const SkillsSectionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [
          Colors.blue,
          Colors.purple,
          Colors.pink,
        ],
      ).createShader(bounds),
      child: Text(
        SkillsConstants.sectionTitle,
        style: TextStyle(
          fontSize: isMobile(context) ? 36 : 48,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
