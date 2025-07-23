import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/constants.dart';

class JourneySection extends StatelessWidget {
  const JourneySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My Journey',
          style: TextStyle(
            color: Colors.white,
            fontSize: isMobile(context) ? 24 : 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'I\'m a computer science student at École Supérieure d\'Informatique (ESI) with 2 years of experience in mobile development. I discovered my passion for Flutter development and have been dedicating my time to mastering cross-platform mobile applications.',
          style: TextStyle(
            color: Colors.grey[300],
            fontSize: 16,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Through my studies and personal projects, I\'ve gained hands-on experience with MongoDB for backend development, allowing me to build complete mobile solutions from frontend to backend.',
          style: TextStyle(
            color: Colors.grey[300],
            fontSize: 16,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'I\'m always eager to learn new technologies and take on challenging projects that help me grow as a developer.',
          style: TextStyle(
            color: Colors.grey[300],
            fontSize: 16,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}
