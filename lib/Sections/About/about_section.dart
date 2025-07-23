import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/constants.dart';
import 'package:mnwr_portfolio/Sections/About/widgets/about_section_title.dart';
import 'package:mnwr_portfolio/Sections/About/widgets/about_subtitle.dart';
import 'package:mnwr_portfolio/Sections/About/widgets/profile_section.dart';
import 'package:mnwr_portfolio/Sections/About/widgets/content_section.dart';
import 'package:mnwr_portfolio/Sections/About/widgets/stats_cards.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startAnimations();
  }

  void _initializeAnimations() {
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOut,
    ));
  }

  void _startAnimations() {
    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
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
      decoration: _buildBackgroundDecoration(),
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Column(
            children: [
              // Section Title
              const AboutSectionTitle(),
              const SizedBox(height: 20),

              // Section Subtitle
              const AboutSubtitle(),
              const SizedBox(height: 80),

              // Main Content
              if (isMobile(context))
                _buildMobileLayout()
              else
                _buildDesktopLayout(),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBackgroundDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF1a1a2e),
          const Color(0xFF16213e),
          const Color(0xFF0f3460),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left side - Profile and badges
        Expanded(
          flex: 1,
          child: Column(
            children: [
              const ProfileSection(),
              const SizedBox(height: 40),
              const StatsCards(),
            ],
          ),
        ),
        const SizedBox(width: 80),
        // Right side - Content
        const Expanded(
          flex: 1,
          child: ContentSection(),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        const ProfileSection(),
        const SizedBox(height: 40),
        const ContentSection(),
        const SizedBox(height: 40),
        const StatsCards(),
      ],
    );
  }
}
