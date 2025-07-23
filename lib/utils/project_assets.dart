class ProjectAssets {
  // Easy Home project screenshots
  static const List<String> easyHomeImages = [
    'assets/easy home/Capture d\'écran 2025-07-23 191916.png',
    'assets/easy home/Capture d\'écran 2025-07-23 191934.png',
    'assets/easy home/Capture d\'écran 2025-07-23 191942.png',
    'assets/easy home/Capture d\'écran 2025-07-23 191948.png',
    'assets/easy home/Capture d\'écran 2025-07-23 191959.png',
    'assets/easy home/Capture d\'écran 2025-07-23 192005.png',
    'assets/easy home/Capture d\'écran 2025-07-23 192013.png',
  ];

  // Madrassat Iqraa project screenshots
  static const List<String> madrassatIqraaImages = [
    'assets/madrasat_iqraa/photo_1_2025-07-23_19-29-56.jpg',
    'assets/madrasat_iqraa/photo_2_2025-07-23_19-29-56.jpg',
    'assets/madrasat_iqraa/photo_3_2025-07-23_19-29-56.jpg',
    'assets/madrasat_iqraa/photo_4_2025-07-23_19-29-56.jpg',
    'assets/madrasat_iqraa/photo_5_2025-07-23_19-29-56.jpg',
    'assets/madrasat_iqraa/photo_6_2025-07-23_19-29-56.jpg',
    'assets/madrasat_iqraa/photo_7_2025-07-23_19-29-56.jpg',
    'assets/madrasat_iqraa/photo_8_2025-07-23_19-29-56.jpg',
    'assets/madrasat_iqraa/photo_9_2025-07-23_19-29-56.jpg',
  ];

  // Dirassaty project screenshots
  static const List<String> dirassatyImages = [
    'assets/dirassati/Capture d\'écran 2025-07-23 193714.png',
    'assets/dirassati/Capture d\'écran 2025-07-23 193837.png',
    'assets/dirassati/Capture d\'écran 2025-07-23 193923.png',
    'assets/dirassati/Capture d\'écran 2025-07-23 193927.png',
    'assets/dirassati/Capture d\'écran 2025-07-23 193945.png',
    'assets/dirassati/Capture d\'écran 2025-07-23 194015.png',
    'assets/dirassati/Capture d\'écran 2025-07-23 194046.png',
    'assets/dirassati/Capture d\'écran 2025-07-23 194108.png',
    'assets/dirassati/Capture d\'écran 2025-07-23 194143.png',
    'assets/dirassati/Capture d\'écran 2025-07-23 194223.png',
  ];

  // Prayer Time project screenshots
  static const List<String> prayerTimeImages = [
    'assets/prayer time/photo_1_2025-07-23_19-31-03.jpg',
    'assets/prayer time/photo_2_2025-07-23_19-31-03.jpg',
    'assets/prayer time/photo_3_2025-07-23_19-31-03.jpg',
    'assets/prayer time/photo_4_2025-07-23_19-31-03.jpg',
    'assets/prayer time/photo_5_2025-07-23_19-31-03.jpg',
  ];

  // Portfolio Website screenshots
  static const List<String> portfolioImages = [
    'assets/portfolio/image.png',
    'assets/portfolio/image copy.png',
    'assets/portfolio/image copy 2.png',
  ];

  // Project logos
  static const Map<String, String> projectLogos = {
    'Easy Home': 'assets/easy home/logo (2).png',
    'Madrassat Iqraa': 'assets/madrasat_iqraa/iqraa_logo.jpeg',
    'Dirassaty': 'assets/dirassati/logo.png',
    'Prayer Time': 'assets/prayer time/prayer_logo.jpeg',
    // Portfolio Website doesn't have a logo file, will use default icon
  };

  // Get images for a specific project
  static List<String> getProjectImages(String projectTitle) {
    switch (projectTitle) {
      case 'Easy Home':
        return easyHomeImages;
      case 'Madrassat Iqraa':
        return madrassatIqraaImages;
      case 'Dirassaty':
        return dirassatyImages;
      case 'Prayer Time':
        return prayerTimeImages;
      case 'Portfolio Website':
        return portfolioImages;
      default:
        return [];
    }
  }

  // Get main screenshot for a project (first image)
  static String? getMainScreenshot(String projectTitle) {
    final images = getProjectImages(projectTitle);
    return images.isNotEmpty ? images.first : null;
  }

  // Get logo for a specific project
  static String? getProjectLogo(String projectTitle) {
    return projectLogos[projectTitle];
  }

  // Check if project has a logo
  static bool hasProjectLogo(String projectTitle) {
    return projectLogos.containsKey(projectTitle);
  }
}
