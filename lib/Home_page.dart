import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/Sections/app%20bar/app_bar.dart';
import 'package:mnwr_portfolio/Sections/Hero/hero_section.dart';
import 'package:mnwr_portfolio/Sections/About/about_section.dart';
import 'package:mnwr_portfolio/Sections/Skills/skills_section.dart';
import 'package:mnwr_portfolio/Sections/Projects/projects_section.dart';
import 'package:mnwr_portfolio/Sections/Contact/contact_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  // Global keys for each section
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void scrollToSection(String section) {
    GlobalKey targetKey;

    switch (section) {
      case 'Home':
        targetKey = _heroKey;
        break;
      case 'About':
        targetKey = _aboutKey;
        break;
      case 'Skills':
        targetKey = _skillsKey;
        break;
      case 'Projects':
        targetKey = _projectsKey;
        break;
      case 'Contact':
        targetKey = _contactKey;
        break;
      default:
        return;
    }

    final context = targetKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(onNavigate: scrollToSection),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            HeroSection(key: _heroKey, onNavigate: scrollToSection),
            AboutSection(key: _aboutKey),
            SkillsSection(key: _skillsKey),
            ProjectsSection(key: _projectsKey),
            ContactSection(key: _contactKey),
          ],
        ),
      ),
    );
  }
}
