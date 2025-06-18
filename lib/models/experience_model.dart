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
      title: 'Freelance Flutter Developer',
      company: 'Fiverr.',
      duration: 'June 2023 - Present',
      description: 'Completed more than 10 Order with repeated customers.',
      responsibilities: [
        'UI/UX Designs of screens',
        'Adding Components and functionalities',
        'Integration of APIs adn Plugins ',
      ],
      companyUrl: 'https://example.com',
      logoUrl: 'assets/icons/fiverr.png',
    ),
    Experience(
      title: 'Remote Flutter Developer internship',
      company: 'Tiers Limited',
      duration: '2024',
      description: 'Developed mobile applications .',
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
      title: 'Freelance Flutter Developer',
      company: 'Fiverr.',
      duration: 'June 2023 - Present',
      description: 'Completed more than 10 Order with repeated customers.',
      responsibilities: [
        'UI/UX Designs of screens',
        'Adding Components and functionalities',
        'Integration of APIs adn Plugins ',
      ],
      companyUrl: 'https://www.fiverr.com/s/99Q8Dw0',
      logoUrl: 'assets/icons/fiverr.png',
      isFreelance: true,
    ),
  ];
} 