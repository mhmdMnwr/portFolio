import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/Sections/app%20bar/app_bar.dart';
import 'package:mnwr_portfolio/Sections/Hero/hero_section.dart';
import 'package:mnwr_portfolio/Sections/About/about_section.dart';
import 'package:mnwr_portfolio/Sections/Skills/skills_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(),
            AboutSection(),
            SkillsSection(),
            // Add more sections here as needed
          ],
        ),
      ),
    );
  }
}
