import 'package:flutter/material.dart';
import 'package:mnwr_portfolio/constants.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _progressController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _progressController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut,
    ));

    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _progressController,
      curve: Curves.easeOut,
    ));

    _fadeController.forward();
    Future.delayed(const Duration(milliseconds: 500), () {
      _progressController.forward();
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _progressController.dispose();
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
            const Color(0xFF1a1a2e),
            const Color(0xFF16213e),
            const Color(0xFF0f3460),
          ],
        ),
      ),
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Column(
          children: [
            // Section Title
            _buildSectionTitle(),
            const SizedBox(height: 20),

            // Section Subtitle
            _buildSubtitle(),
            const SizedBox(height: 80),

            // Skills Grid
            _buildSkillsGrid(),
            const SizedBox(height: 80),

            // Technologies Learning Section
            _buildTechnologiesLearning(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle() {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [
          Colors.blue,
          Colors.purple,
          Colors.pink,
        ],
      ).createShader(bounds),
      child: Text(
        'Skills & Technologies',
        style: TextStyle(
          fontSize: isMobile(context) ? 36 : 48,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildSubtitle() {
    return Text(
      'Technologies I\'m learning and working with as I grow as a developer',
      style: TextStyle(
        color: Colors.grey[400],
        fontSize: isMobile(context) ? 16 : 18,
        height: 1.6,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildSkillsGrid() {
    if (isMobile(context)) {
      return Column(
        children: [
          _buildSkillCategory(
            'Mobile Development',
            [
              {'name': 'Flutter', 'level': 0.70, 'color': Colors.blue},
              {'name': 'Dart', 'level': 0.75, 'color': Colors.blue},
              {'name': 'iOS Development', 'level': 0.45, 'color': Colors.grey},
            ],
          ),
          const SizedBox(height: 40),
          _buildSkillCategory(
            'Backend & Database',
            [
              {'name': 'MongoDB', 'level': 0.65, 'color': Colors.green},
              {'name': 'Node.js', 'level': 0.55, 'color': Colors.green},
              {'name': 'Firebase', 'level': 0.60, 'color': Colors.orange},
            ],
          ),
          const SizedBox(height: 40),
          _buildSkillCategory(
            'Tools & Technologies',
            [
              {'name': 'Git/GitHub', 'level': 0.70, 'color': Colors.grey},
              {'name': 'VS Code', 'level': 0.80, 'color': Colors.blue},
              {'name': 'Figma', 'level': 0.60, 'color': Colors.pink},
            ],
          ),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _buildSkillCategory(
            'Mobile Development',
            [
              {'name': 'Flutter', 'level': 0.70, 'color': Colors.blue},
              {'name': 'Dart', 'level': 0.75, 'color': Colors.blue},
              {'name': 'iOS Development', 'level': 0.45, 'color': Colors.grey},
            ],
          ),
        ),
        const SizedBox(width: 40),
        Expanded(
          child: _buildSkillCategory(
            'Backend & Database',
            [
              {'name': 'MongoDB', 'level': 0.65, 'color': Colors.green},
              {'name': 'Node.js', 'level': 0.55, 'color': Colors.green},
              {'name': 'Firebase', 'level': 0.60, 'color': Colors.orange},
            ],
          ),
        ),
        const SizedBox(width: 40),
        Expanded(
          child: _buildSkillCategory(
            'Tools & Technologies',
            [
              {'name': 'Git/GitHub', 'level': 0.70, 'color': Colors.grey},
              {'name': 'VS Code', 'level': 0.80, 'color': Colors.blue},
              {'name': 'Figma', 'level': 0.60, 'color': Colors.pink},
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSkillCategory(String title, List<Map<String, dynamic>> skills) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.blue,
              fontSize: isMobile(context) ? 18 : 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          ...skills.map((skill) => _buildSkillItem(
                skill['name'],
                skill['level'],
                skill['color'],
              )),
        ],
      ),
    );
  }

  Widget _buildSkillItem(String name, double level, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '${(level * 100).toInt()}%',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: 8,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(4),
            ),
            child: AnimatedBuilder(
              animation: _progressAnimation,
              builder: (context, child) {
                return FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: level * _progressAnimation.value,
                  child: Container(
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTechnologiesLearning() {
    return Column(
      children: [
        Text(
          'Technologies I\'m Learning',
          style: TextStyle(
            color: Colors.white,
            fontSize: isMobile(context) ? 24 : 28,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),

        // First row of technologies
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          children: [
            _buildTechTag('Flutter', Colors.blue),
            _buildTechTag('Dart', Colors.blue),
            _buildTechTag('MongoDB', Colors.green),
            _buildTechTag('Node.js', Colors.green),
            _buildTechTag('Firebase', Colors.orange),
            _buildTechTag('Git', Colors.grey),
            _buildTechTag('VS Code', Colors.blue),
            _buildTechTag('REST APIs', Colors.purple),
            _buildTechTag('JSON', Colors.yellow),
            _buildTechTag('Material Design', Colors.blue),
          ],
        ),
        const SizedBox(height: 20),

        // Second row of technologies
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          children: [
            _buildTechTag('Cupertino', Colors.grey),
            _buildTechTag('State Management', Colors.purple),
            _buildTechTag('Provider', Colors.blue),
            _buildTechTag('Postman', Colors.orange),
            _buildTechTag('GitHub', Colors.grey),
            _buildTechTag('Figma', Colors.pink),
            _buildTechTag('Android Studio', Colors.green),
          ],
        ),
      ],
    );
  }

  Widget _buildTechTag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
