class Achievement {
  final String title;
  final String description;
  final String? date;
  final String? imageUrl;
  final String? certificateUrl;
  final String? issuedBy;

  Achievement({
    required this.title,
    required this.description,
    this.date,
    this.imageUrl,
    this.certificateUrl,
    this.issuedBy,
  });

  // Sample achievements data
  static List<Achievement> sampleAchievements = [
    Achievement(
      title: 'Google Flutter Certified Developer',
      description: 'Earned certification for advanced Flutter development skills',
      date: 'October 2022',
      imageUrl: 'assets/images/achievement1.png',
      certificateUrl: 'https://example.com/certificate',
      issuedBy: 'Google Developers',
    ),
    Achievement(
      title: 'Best Mobile App Award',
      description: 'Won the Best Mobile App award at the Annual Tech Summit for developing an innovative health tracking application',
      date: 'June 2021',
      imageUrl: 'assets/images/achievement2.png',
      issuedBy: 'Tech Summit 2021',
    ),
    Achievement(
      title: 'Top Rated Flutter Developer',
      description: 'Recognized as a Top Rated Flutter Developer on Fiverr with over 100 successful projects',
      date: 'March 2021',
      imageUrl: 'assets/images/achievement3.png',
      issuedBy: 'Fiverr',
    ),
    Achievement(
      title: 'Flutter Community Contributor',
      description: 'Contributed to multiple open-source Flutter packages with over 500 stars on GitHub',
      date: 'Ongoing',
      imageUrl: 'assets/images/achievement4.png',
      issuedBy: 'Flutter Community',
    ),
    Achievement(
      title: 'Featured App on Play Store',
      description: 'Developed a Flutter app that was featured in the Google Play Store\'s Editor\'s Choice section',
      date: 'August 2020',
      imageUrl: 'assets/images/achievement5.png',
      issuedBy: 'Google Play Store',
    ),
  ];
} 