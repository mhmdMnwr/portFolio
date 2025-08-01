import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/constants.dart';

class AboutSubtitle extends StatelessWidget {
  const AboutSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AboutConstants.subtitle,
      style: TextStyle(
        color: Colors.grey[400],
        fontSize: isMobile(context) ? 16 : 18,
        height: 1.6,
      ),
      textAlign: TextAlign.center,
    );
  }
}
