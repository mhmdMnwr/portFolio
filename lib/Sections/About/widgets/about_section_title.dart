import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/constants.dart';

class AboutSectionTitle extends StatelessWidget {
  const AboutSectionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [
          Colors.blue,
          Colors.purple,
          Colors.pink,
        ],
      ).createShader(bounds),
      child: Text(
        'About Me',
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
