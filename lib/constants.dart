import 'package:flutter/material.dart';

// Responsive breakpoints
bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 768;
bool isTablet(BuildContext context) =>
    MediaQuery.of(context).size.width >= 768 &&
    MediaQuery.of(context).size.width < 1024;

// App Bar Constants
// App Bar Constants
class AppBarConstants {
  static const String appTitle = 'DevPortfolio';
  static const List<String> menuItems = [
    'Home',
    'About',
    'Skills',
    'Projects',
    'Contact',
  ];
}

// Hero Section Constants
class HeroConstants {
  static const String name = 'Ameur Mohammed Menouer';
  static const String studentBadgeText = 'Computer Science Student at ESI SBA';
  static const String mainTitle = 'Flutter Developer';
  static const String descriptionPart1 =
      'Learning to build beautiful mobile applications with ';
  static const String flutterText = 'Flutter';
  static const String descriptionConnector = ' and ';
  static const String mongodbText = 'MongoDB';

  // Action Buttons
  static const String viewProjectsButton = 'View My Projects';
  static const String downloadCvButton = 'Download CV';

  // Stats
  static const String schoolStat = 'ESI Sidi Bel Abbès';
  static const String schoolStatMobile = 'ESI\nSidi Bel Abbès';
  static const String appsStat = '5 Apps Built';
  static const String experienceStat = '3 Years Learning';

  // Floating Button Tooltips
  static const String toggleThemeTooltip = 'Toggle Theme';
  static const String githubTooltip = 'GitHub';
  static const String linkedinTooltip = 'LinkedIn';
  static const String emailTooltip = 'Email';
}

// About Section Constants
class AboutConstants {
  static const String sectionTitle = 'About Me';
  static const String subtitle =
      'Computer science student passionate about mobile development and\nlearning new technologies';

  // Profile Section
  static const String profileTitle = 'Computer Science Student';
  static const String experienceDetail = '3+ Years';
  static const String schoolDetail = 'ESI Student';

  // Skill Tags
  static const List<String> skillTags = [
    'Flutter Enthusiast',
    'MongoDB',
    'Learning',
  ];

  // Journey Section
  static const String journeyTitle = 'My Journey';
  static const String journeyParagraph1 =
      'I\'m a computer science student at École Supérieure d\'Informatique (ESI) Sidi Bel Abbès with 3 years of experience in mobile development. I discovered my passion for Flutter development and have been dedicating my time to mastering cross-platform mobile applications.';
  static const String journeyParagraph2 =
      'Through my studies and personal projects, I\'ve gained hands-on experience with MongoDB for backend development, allowing me to build complete mobile solutions from frontend to backend.';
  static const String journeyParagraph3 =
      'I\'m always eager to learn new technologies and take on challenging projects that help me grow as a developer.';

  // Education Section
  static const String educationTitle = 'Education';
  static const String schoolName =
      'École Supérieure d\'Informatique (ESI) Sidi Bel Abbès';
  static const String degreeType = 'Computer Science Degree';
  static const String enrollmentStatus = 'Currently Enrolled';

  // Stats Cards
  static const String appsBuiltNumber = '5 Apps';
  static const String appsBuiltLabel = 'Built';
  static const String learningYearsNumber = '3 Years';
  static const String learningYearsLabel = 'Learning';
}

// Skills Section Constants
class SkillsConstants {
  static const String sectionTitle = 'Skills & Technologies';
  static const String subtitle =
      'Technologies I\'m learning and working with as I grow as a developer';
  static const String technologiesLearningTitle = 'Technologies I\'m Learning';

  // Skill Categories
  static const String mobileCategory = 'Mobile Development';
  static const String backendCategory = 'Backend & Database';
  static const String toolsCategory = 'Tools & Technologies';

  // Technology Tags
  static const List<String> techTags = [
    'Flutter',
    'Dart',
    'MongoDB',
    'Node.js',
    'Firebase',
    'Git',
    'VS Code',
    'REST APIs',
    'JSON',
    'Material Design',
    'Cupertino',
    'State Management',
    'Provider',
    'Postman',
    'GitHub',
    'Figma',
    'Android Studio',
  ];

  // Skills Data
  static const List<Map<String, dynamic>> mobileSkills = [
    {'name': 'Flutter', 'level': 0.70, 'color': Colors.blue},
    {'name': 'Dart', 'level': 0.75, 'color': Colors.blue},
    {'name': 'iOS Development', 'level': 0.45, 'color': Colors.grey},
  ];

  static const List<Map<String, dynamic>> backendSkills = [
    {'name': 'MongoDB', 'level': 0.65, 'color': Colors.green},
    {'name': 'Node.js', 'level': 0.55, 'color': Colors.green},
    {'name': 'Firebase', 'level': 0.60, 'color': Colors.orange},
  ];

  static const List<Map<String, dynamic>> toolsSkills = [
    {'name': 'Git/GitHub', 'level': 0.70, 'color': Colors.grey},
    {'name': 'VS Code', 'level': 0.80, 'color': Colors.blue},
    {'name': 'Figma', 'level': 0.60, 'color': Colors.pink},
  ];
}

// Projects Section Constants
class ProjectsConstants {
  static const String sectionTitle = 'My Projects';
  static const String subtitle =
      'Here are some of the mobile applications I\'ve built during my learning journey';

  // Project Data
  static const List<Map<String, dynamic>> projects = [
    {
      'title': 'Easy Home',
      'description':
          'A mobile app that connects clients with craftsmen around them. Clients can browse available craftsmen and receive offers, while craftsmen can apply for jobs and submit their proposals.',
      'technologies': ['Flutter', 'Dart', 'MongoDB', 'REST APIs'],
      'category': 'Service Platform',
      'icon': '🏠',
      'color': Colors.blue,
    },
    {
      'title': 'Madrassat Iqraa',
      'description':
          'A comprehensive mobile application for Quranic schools that handles student and teacher registration, and manages financial transactions efficiently.',
      'technologies': ['Flutter', 'Dart', 'Firebase', 'Payment Integration'],
      'category': 'Educational',
      'icon': '📚',
      'color': Colors.green,
    },
    {
      'title': 'Dirassaty',
      'description':
          'A private school management app that allows parents to track their children\'s academic progress, view grades, and access important school information.',
      'technologies': ['Flutter', 'Dart', 'MongoDB', 'User Authentication'],
      'category': 'Education Management',
      'icon': '🎓',
      'color': Colors.purple,
    },
    {
      'title': 'Prayer Time',
      'description':
          'An Islamic app providing accurate prayer times based on location, along with a collection of daily adhkar (remembrance) and Islamic content.',
      'technologies': ['Flutter', 'Dart', 'Location Services', 'Local Storage'],
      'category': 'Islamic',
      'icon': '🕌',
      'color': Colors.orange,
    },
    {
      'title': 'Portfolio Website',
      'description':
          'A responsive Flutter web portfolio showcasing my projects, skills, and journey as a mobile developer. Built with modern UI/UX principles.',
      'technologies': ['Flutter', 'Dart', 'Web', 'Responsive Design'],
      'category': 'Portfolio',
      'icon': '💼',
      'color': Colors.pink,
    },
  ];
}

// Contact Section Constants
class ContactConstants {
  static const String sectionTitle = 'Get In Touch';
  static const String subtitle =
      'Feel free to reach out if you\'re looking for a developer, have a question, or just want to connect.';

  // Contact Information
  static const String name = 'Ameur Mohammed Menouer';
  static const String email = 'mm.ameur@esi-sba.dz';
  static const String phone = '+213 658 450 106';
  static const String location = 'Mascara, Algeria';
  static const String emailLabel = 'Email';
  static const String phoneLabel = 'Phone';
  static const String locationLabel = 'Location';

  // Contact info section
  static const String infoTitle = 'Contact Information';
  static const String infoDescription =
      'Feel free to get in touch with me. I am always open to discussing new opportunities.';

  // Social media
  static const String socialTitle = 'Follow Me';
  static const String socialDescription = 'Let\'s connect on social platforms';
  static const String linkedinUrl = 'https://linkedin.com/in/mnwr-ameur';
  static const String githubUrl = 'https://github.com/mhmdMnwr';
  static const String facebookUrl = 'https://facebook.com/menouer.ameur';

  // Availability
  static const String availabilityMessage =
      'Currently available for freelance work and open to discussing new opportunities.';
}

// Color Constants
class AppColors {
  // Gradient Colors
  static const List<Color> backgroundGradient = [
    Color(0xFF1a1a2e),
    Color(0xFF16213e),
    Color(0xFF0f3460),
  ];

  static const List<Color> titleGradient = [
    Colors.blue,
    Colors.purple,
    Colors.pink,
  ];

  static const List<Color> buttonGradient = [
    Colors.blue,
    Colors.purple,
  ];

  // Text Colors
  static const Color primaryText = Colors.white;
  static const Color secondaryText = Color(0xFFBDBDBD); // Colors.grey[300]
  static const Color tertiaryText = Color(0xFF9E9E9E); // Colors.grey[400]

  // Background Colors
  static const Color background = Color(0xFF1a1a2e);
  static const Color cardBackground = Color(0xFF16213e);

  // Accent Colors
  static const Color accent = Colors.blue;
  static const Color blueAccent = Colors.blue;
  static const Color purpleAccent = Colors.purple;
  static const Color greenAccent = Colors.green;
  static const Color orangeAccent = Colors.orange;
  static const Color pinkAccent = Colors.pink;
}

// Animation Constants
class AnimationConstants {
  static const Duration fadeAnimationDuration = Duration(milliseconds: 1500);
  static const Duration slideAnimationDuration = Duration(milliseconds: 1200);
  static const Duration hoverAnimationDuration = Duration(milliseconds: 200);
  static const Duration progressAnimationDuration =
      Duration(milliseconds: 2000);
}

// Layout Constants
class LayoutConstants {
  static const double desktopBreakpoint = 900;
  static const double mobileHorizontalPadding = 20;
  static const double desktopHorizontalPadding = 80;
  static const double mobileVerticalPadding = 60;
  static const double desktopVerticalPadding = 100;

  // Border Radius
  static const double smallBorderRadius = 8;
  static const double mediumBorderRadius = 12;
  static const double largeBorderRadius = 16;
  static const double xlBorderRadius = 20;
  static const double circularBorderRadius = 25;

  // Spacing
  static const double smallSpacing = 10;
  static const double mediumSpacing = 20;
  static const double largeSpacing = 40;
  static const double xlargeSpacing = 80;
}
