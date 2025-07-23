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
          AboutConstants.journeyTitle,
          style: TextStyle(
            color: Colors.white,
            fontSize: isMobile(context) ? 24 : 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          AboutConstants.journeyParagraph1,
          style: TextStyle(
            color: Colors.grey[300],
            fontSize: 16,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          AboutConstants.journeyParagraph2,
          style: TextStyle(
            color: Colors.grey[300],
            fontSize: 16,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          AboutConstants.journeyParagraph3,
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
