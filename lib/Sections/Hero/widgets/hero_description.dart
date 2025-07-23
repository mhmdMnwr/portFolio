import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/constants.dart';

class HeroDescription extends StatelessWidget {
  const HeroDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          HeroConstants.descriptionPart1,
          style: TextStyle(
            color: Colors.grey[300],
            fontSize: isMobile(context) ? 16 : 18,
            height: 1.6,
          ),
          textAlign: TextAlign.center,
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: HeroConstants.flutterText,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: isMobile(context) ? 16 : 18,
                  fontWeight: FontWeight.w600,
                  height: 1.6,
                ),
              ),
              TextSpan(
                text: HeroConstants.descriptionConnector,
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: isMobile(context) ? 16 : 18,
                  height: 1.6,
                ),
              ),
              TextSpan(
                text: HeroConstants.mongodbText,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: isMobile(context) ? 16 : 18,
                  fontWeight: FontWeight.w600,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
