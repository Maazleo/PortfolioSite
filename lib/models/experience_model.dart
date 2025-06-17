class Experience {
  final String title;
  final String company;
  final String duration;
  final String description;
  final List<String> responsibilities;
  final String? companyUrl;
  final String? logoUrl;
  final bool isFreelance;

  Experience({
    required this.title,
    required this.company,
    required this.duration,
    required this.description,
    required this.responsibilities,
    this.companyUrl,
    this.logoUrl,
    this.isFreelance = false,
  });

  // Sample work experiences
  static List<Experience> sampleWorkExperiences = [
    Experience(
      title: 'Senior Flutter Developer',
      company: 'Tech Solutions Inc.',
      duration: 'Jan 2022 - Present',
      description: 'Leading Flutter development team for enterprise applications.',
      responsibilities: [
        'Architected and developed cross-platform mobile applications using Flutter',
        'Led a team of 5 developers and mentored junior developers',
        'Implemented CI/CD pipelines for automated testing and deployment',
        'Reduced app loading time by 40% through performance optimizations',
      ],
      companyUrl: 'https://example.com',
      logoUrl: 'assets/images/company1.png',
    ),
    Experience(
      title: 'Flutter Developer',
      company: 'Mobile Innovations',
      duration: 'Mar 2020 - Dec 2021',
      description: 'Developed mobile applications for clients across various industries.',
      responsibilities: [
        'Developed and maintained multiple Flutter applications for iOS and Android',
        'Collaborated with design team to implement responsive UI/UX',
        'Integrated RESTful APIs and implemented state management solutions',
        'Participated in code reviews and implemented best practices',
      ],
      companyUrl: 'https://example.com',
      logoUrl: 'assets/images/company2.png',
    ),
  ];

  // Sample freelance experiences
  static List<Experience> sampleFreelanceExperiences = [
    Experience(
      title: 'Flutter App Developer',
      company: 'Fiverr',
      duration: 'Jan 2019 - Present',
      description: 'Providing Flutter development services to clients worldwide.',
      responsibilities: [
        'Developed custom Flutter applications for clients with 100% satisfaction rate',
        'Created UI/UX designs and implemented them using Flutter',
        'Provided maintenance and support for existing applications',
        'Achieved Top Rated seller status with 4.9/5 rating',
      ],
      companyUrl: 'https://fiverr.com/yourusername',
      logoUrl: 'assets/images/fiverr.png',
      isFreelance: true,
    ),
    Experience(
      title: 'Mobile App Developer',
      company: 'Upwork',
      duration: 'Jun 2018 - Present',
      description: 'Delivering high-quality Flutter applications to clients.',
      responsibilities: [
        'Developed and deployed over 20 Flutter applications for various clients',
        'Maintained long-term relationships with clients through quality work',
        'Specialized in e-commerce and social media applications',
        'Achieved Top Rated Plus status with 100% job success score',
      ],
      companyUrl: 'https://upwork.com/yourusername',
      logoUrl: 'assets/images/upwork.png',
      isFreelance: true,
    ),
  ];
} 