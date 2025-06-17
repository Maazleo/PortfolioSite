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
      title: 'Flutter E-Commerce App',
      description: 'A complete e-commerce solution with cart, payment integration, and admin dashboard.',
      imageUrl: 'https://picsum.photos/800/450?random=1',
      githubUrl: 'https://github.com/yourusername/flutter-ecommerce',
      liveUrl: 'https://flutter-ecommerce-demo.netlify.app',
      technologies: ['Flutter', 'Firebase', 'Stripe', 'Provider'],
      featured: true,
    ),
    Project(
      title: 'Task Management App',
      description: 'A productivity app for managing tasks with reminders, categories, and progress tracking.',
      imageUrl: 'https://picsum.photos/800/450?random=2',
      githubUrl: 'https://github.com/yourusername/task-manager',
      technologies: ['Flutter', 'Hive', 'BLoC'],
      featured: true,
    ),
    Project(
      title: 'Weather Forecast App',
      description: 'Real-time weather forecasting with beautiful UI and animations.',
      imageUrl: 'https://picsum.photos/800/450?random=3',
      githubUrl: 'https://github.com/yourusername/weather-app',
      liveUrl: 'https://weather-app-demo.netlify.app',
      technologies: ['Flutter', 'OpenWeatherMap API', 'GetX'],
    ),
    Project(
      title: 'Social Media App',
      description: 'A social networking platform with real-time chat, posts, and user profiles.',
      imageUrl: 'https://picsum.photos/800/450?random=4',
      githubUrl: 'https://github.com/yourusername/social-app',
      technologies: ['Flutter', 'Firebase', 'Cloud Functions'],
    ),
    Project(
      title: 'Fitness Tracker',
      description: 'Track workouts, nutrition, and progress with customizable plans and analytics.',
      imageUrl: 'https://picsum.photos/800/450?random=5',
      githubUrl: 'https://github.com/yourusername/fitness-tracker',
      technologies: ['Flutter', 'SQLite', 'Charts'],
    ),
  ];
} 