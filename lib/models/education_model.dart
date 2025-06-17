class Education {
  final String degree;
  final String institution;
  final String duration;
  final String? description;
  final String? logoUrl;
  final List<String>? achievements;

  Education({
    required this.degree,
    required this.institution,
    required this.duration,
    this.description,
    this.logoUrl,
    this.achievements,
  });

  // Sample education data
  static List<Education> sampleEducation = [
    Education(
      degree: 'Bachelor of Science in Computer Science',
      institution: 'University of Technology',
      duration: '2016 - 2020',
      description: 'Specialized in Mobile Application Development and Software Engineering',
      logoUrl: 'assets/images/university1.png',
      achievements: [
        'Graduated with First Class Honours',
        'Dean\'s List for Academic Excellence',
        'Best Final Year Project Award',
      ],
    ),
    Education(
      degree: 'Flutter Development Certification',
      institution: 'Google Developers',
      duration: '2020',
      description: 'Advanced Flutter Development Course',
      logoUrl: 'assets/images/google.png',
    ),
    Education(
      degree: 'Mobile App Development Bootcamp',
      institution: 'Tech Academy',
      duration: '2019',
      description: 'Intensive 3-month bootcamp focusing on mobile app development',
      logoUrl: 'assets/images/academy.png',
    ),
  ];
}

class Skill {
  final String name;
  final double proficiency; // 0.0 to 1.0
  final String category;
  final String? iconPath;

  Skill({
    required this.name,
    required this.proficiency,
    required this.category,
    this.iconPath,
  });

  // Sample skills data
  static List<Skill> sampleSkills = [
    // Programming Languages
    Skill(
      name: 'Dart',
      proficiency: 0.95,
      category: 'Programming Languages',
      iconPath: 'assets/icons/dart.svg',
    ),
    Skill(
      name: 'JavaScript',
      proficiency: 0.85,
      category: 'Programming Languages',
      iconPath: 'assets/icons/javascript.svg',
    ),
    Skill(
      name: 'Python',
      proficiency: 0.80,
      category: 'Programming Languages',
      iconPath: 'assets/icons/python.svg',
    ),
    
    // Frameworks
    Skill(
      name: 'Flutter',
      proficiency: 0.95,
      category: 'Frameworks',
      iconPath: 'assets/icons/flutter.svg',
    ),
    Skill(
      name: 'React Native',
      proficiency: 0.75,
      category: 'Frameworks',
      iconPath: 'assets/icons/react.svg',
    ),
    Skill(
      name: 'Firebase',
      proficiency: 0.90,
      category: 'Frameworks',
      iconPath: 'assets/icons/firebase.svg',
    ),
    
    // Tools
    Skill(
      name: 'Git',
      proficiency: 0.85,
      category: 'Tools',
      iconPath: 'assets/icons/git.svg',
    ),
    Skill(
      name: 'VS Code',
      proficiency: 0.90,
      category: 'Tools',
      iconPath: 'assets/icons/vscode.svg',
    ),
    Skill(
      name: 'Figma',
      proficiency: 0.80,
      category: 'Tools',
      iconPath: 'assets/icons/figma.svg',
    ),
    
    // Other
    Skill(
      name: 'UI/UX Design',
      proficiency: 0.85,
      category: 'Other',
      iconPath: 'assets/icons/design.svg',
    ),
    Skill(
      name: 'RESTful APIs',
      proficiency: 0.90,
      category: 'Other',
      iconPath: 'assets/icons/api.svg',
    ),
    Skill(
      name: 'State Management',
      proficiency: 0.90,
      category: 'Other',
      iconPath: 'assets/icons/state.svg',
    ),
  ];
  
  // Get skills by category
  static Map<String, List<Skill>> getSkillsByCategory() {
    Map<String, List<Skill>> categorizedSkills = {};
    
    for (var skill in sampleSkills) {
      if (!categorizedSkills.containsKey(skill.category)) {
        categorizedSkills[skill.category] = [];
      }
      categorizedSkills[skill.category]!.add(skill);
    }
    
    return categorizedSkills;
  }
} 