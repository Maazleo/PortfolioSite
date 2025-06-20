class Project {
  final String title;
  final String description;
  final String imageUrl;
  final String githubUrl;
  final String? liveUrl;
  final List<String> technologies;
  final bool featured;

  Project({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.githubUrl,
    this.liveUrl,
    required this.technologies,
    this.featured = false,
  });

  // Sample projects data
  static List<Project> sampleProjects = [
    Project(
      title: 'Flutter CineBook App',
      description: 'CineBOOK is a sleek and intuitive mobile application designed with Flutter, catering to movie buffs and TV show enthusiasts. With cineBOOK, discovering, organizing, and managing your favorite films and shows has never been easier.',
      imageUrl: 'assets/images/cine.png',
      githubUrl: 'https://github.com/Maazleo/CineBook-movie-Cataloguie-app-with-Firebase',
      liveUrl: 'https://cinebookapp.netlify.app',
      technologies: ['Flutter', 'Firebase', 'Apis', 'Provider'],
      featured: true,
    ),
    Project(
      title: 'Digital Academic Portal - Management App',
      description: 'A productivity app for managing tasks with reminders, categories, and progress tracking.',
      imageUrl: 'assets/icons/gap.png',
      githubUrl: 'https://github.com/HafizHuzaifa76/DigitalAcademicPortal-FYP',
      technologies: ['Flutter', 'Hive', 'BLoC'],
      featured: true,
    ),
    Project(
      title: 'YourJahez App - Anti Jahez Awareness App compaign  ',
      description: 'A anti jahez compaign awareness app with a surprise.',
      imageUrl: 'assets/images/jahez.png',
      githubUrl: 'https://github.com/Maazleo/Your_Jahez_App',
      liveUrl: 'https://github.com/Maazleo/Your_Jahez_App',
      technologies: ['Flutter', 'Firebase', 'GetX'],
    ),
    Project(
      title: 'Qr Code Scanner Generator',
      description: 'A Flutter app for scanning and generating QR codes.',
      imageUrl: 'assets/images/jahez.png',
      githubUrl: 'https://github.com/Maazleo/qr-code-scanner-app',
      technologies: ['Flutter', 'SQLite', 'Charts'],
    ),
    Project(
      title: 'PakiFlix-Netflix Clone App',
      description: 'A social networking platform with real-time chat, posts, and user profiles.',
      imageUrl: 'assets/images/projects/social_app.png',
      githubUrl: 'https://github.com/yourusername/social-app',
      technologies: ['Flutter', 'Firebase', 'Cloud Functions'],
    ),

  ];
} 