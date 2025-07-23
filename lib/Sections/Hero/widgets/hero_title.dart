import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/constants.dart';

class HeroTitle extends StatelessWidget {
  const HeroTitle({super.key});

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
        HeroConstants.mainTitle,
        style: TextStyle(
          fontSize: isMobile(context) ? 36 : 56,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          height: 1.2,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
