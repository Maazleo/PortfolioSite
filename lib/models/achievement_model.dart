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
      title: 'Level 1 Rated Flutter Developer on Fiverr',
      description: 'Recognized as a Level 1 Rated Flutter Developer on Fiverr with over 100 successful projects',
      date: 'March 2025',
      imageUrl: 'assets/images/achievement3.png',
      issuedBy: 'Fiverr',
    ),
    Achievement(
      title: 'LinkedIn Flutter Certified Developer',
      description: 'Earned certification for advanced Flutter development skills',
      date: 'October 2024',
      imageUrl: 'assets/images/achievement1.png',
      //certificateUrl: 'https://example.com/certificate',
      issuedBy: 'LinkedIn Learning',
    ),
    Achievement(
      title: 'DataCamp Certified Python Developer',
      description: 'Datacamp certification in DataScience and Machine Learning with Python',
      date: 'June 2024',
      imageUrl: 'assets/images/achievement2.png',
      issuedBy: 'DataCamp',
    ),

  ];
} 