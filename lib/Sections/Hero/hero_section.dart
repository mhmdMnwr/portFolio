import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/constants.dart';
import 'package:mnwr_portfolio/Sections/Hero/widgets/student_badge.dart';
import 'package:mnwr_portfolio/Sections/Hero/widgets/hero_title.dart';
import 'package:mnwr_portfolio/Sections/Hero/widgets/hero_description.dart';
import 'package:mnwr_portfolio/Sections/Hero/widgets/action_buttons.dart';
import 'package:mnwr_portfolio/Sections/Hero/widgets/stats_section.dart';
import 'package:mnwr_portfolio/Sections/Hero/widgets/scroll_indicator.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
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
      height: MediaQuery.of(context).size.height - kToolbarHeight,
      decoration: _buildBackgroundDecoration(),
      child: Stack(
        children: [
          // Main content
          _buildMainContent(),

          // Scroll indicator at bottom
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: const ScrollIndicator(),
          ),
        ],
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

  Widget _buildMainContent() {
    return Center(
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile(context) ? 20 : 60,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Computer Science Student badge
                const StudentBadge(),
                const SizedBox(height: 40),

                // Main title
                const HeroTitle(),
                const SizedBox(height: 30),

                // Description
                const HeroDescription(),
                const SizedBox(height: 50),

                // Action buttons
                const ActionButtons(),
                const SizedBox(height: 80),

                // Stats section
                const StatsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
