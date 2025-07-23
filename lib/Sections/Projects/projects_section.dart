import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/constants.dart';
import 'widgets/projects_section_title.dart';
import 'widgets/projects_subtitle.dart';
import 'widgets/projects_grid.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut,
    ));

    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile(context) ? 20 : 80,
        vertical: isMobile(context) ? 60 : 100,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF0f3460),
            const Color(0xFF16213e),
            const Color(0xFF1a1a2e),
          ],
        ),
      ),
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Column(
          children: [
            // Section Title
            const ProjectsSectionTitle(),
            const SizedBox(height: 20),

            // Section Subtitle
            const ProjectsSubtitle(),
            const SizedBox(height: 80),

            // Projects Grid
            const ProjectsGrid(),
          ],
        ),
      ),
    );
  }
}
