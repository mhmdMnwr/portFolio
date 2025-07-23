import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/Sections/About/widgets/journey_section.dart';
import 'package:mnwr_portfolio/Sections/About/widgets/education_section.dart';

class ContentSection extends StatelessWidget {
  const ContentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // My Journey Section
        const JourneySection(),
        const SizedBox(height: 40),

        // Education Section
        const EducationSection(),
      ],
    );
  }
}
