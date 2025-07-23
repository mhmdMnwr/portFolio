import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/constants.dart';

class SkillsSubtitle extends StatelessWidget {
  const SkillsSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      SkillsConstants.subtitle,
      style: TextStyle(
        color: Colors.grey[400],
        fontSize: isMobile(context) ? 16 : 18,
        height: 1.6,
      ),
      textAlign: TextAlign.center,
    );
  }
}
