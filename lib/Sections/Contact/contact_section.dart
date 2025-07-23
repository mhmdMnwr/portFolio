import 'package:flutter/material.dart';
import '../../constants.dart';
import 'widgets/contact_form.dart';
import 'widgets/contact_info.dart';
import 'widgets/social_links.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _startAnimations();
  }

  void _setupAnimations() {
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1000),
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
      curve: Curves.easeOutCubic,
    ));
  }

  void _startAnimations() {
    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) {
        _fadeController.forward();
        _slideController.forward();
      }
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = screenSize.width > 1024;
    final isTablet = screenSize.width > 768 && screenSize.width <= 1024;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 60 : 20),
        vertical: isDesktop ? 100 : (isTablet ? 80 : 60),
      ),
      child: AnimatedBuilder(
        animation: _fadeAnimation,
        builder: (context, child) {
          return FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildSectionTitle(),
                  const SizedBox(height: 20),
                  _buildSectionDescription(),
                  const SizedBox(height: 60),
                  if (isDesktop)
                    _buildDesktopLayout()
                  else
                    _buildMobileLayout(),
                  const SizedBox(height: 60),
                  const SocialLinks(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle() {
    return Text(
      ContactConstants.sectionTitle,
      style: const TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryText,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildSectionDescription() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 600),
      child: Text(
        ContactConstants.subtitle,
        style: const TextStyle(
          fontSize: 18,
          color: AppColors.secondaryText,
          height: 1.6,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: const ContactForm(),
          ),
        ),
        const SizedBox(width: 40),
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: const ContactInfo(),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: const ContactInfo(),
        ),
        const SizedBox(height: 30),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: const ContactForm(),
        ),
      ],
    );
  }
}
