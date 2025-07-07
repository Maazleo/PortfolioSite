class Project {
  final String title;
  final String description;
  final String imageUrl;
  final String githubUrl;
  final String? liveUrl;
  final List<String> technologies;
  final bool featured;
  final String category;

  Project({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.githubUrl,
    this.liveUrl,
    required this.technologies,
    this.featured = false,
    required this.category,
  });

  // Sample projects data
  static List<Project> sampleProjects = [
    // FLUTTER PROJECTS
    Project(
      title: 'Flutter CineBook App',
      description: 'CineBOOK is a sleek and intuitive mobile application designed with Flutter, catering to movie buffs and TV show enthusiasts. With cineBOOK, discovering, organizing, and managing your favorite films and shows has never been easier.',
      imageUrl: 'assets/images/cine.png',
      githubUrl: 'https://github.com/Maazleo/CineBook-movie-Cataloguie-app-with-Firebase',
      liveUrl: 'https://cinebookapp.netlify.app',
      technologies: ['Flutter', 'Firebase', 'Apis', 'Provider'],
      featured: true,
      category: 'Flutter',
    ),
    Project(
      title: 'Digital Academic Portal - Management App',
      description: 'A productivity app for managing tasks with reminders, categories, and progress tracking.',
      imageUrl: 'assets/images/DapPortal.png',
      githubUrl: 'https://github.com/HafizHuzaifa76/DigitalAcademicPortal-FYP',
      technologies: ['Flutter', 'Hive', 'BLoC'],
      featured: true,
      category: 'Flutter',
    ),
    Project(
      title: 'YourJahez App - Anti Jahez Awareness App ',
      description: 'A anti jahez compaign awareness app with a surprise.',
      imageUrl: 'assets/images/jahez.png',
      githubUrl: 'https://github.com/Maazleo/Your_Jahez_App',
      liveUrl: 'https://github.com/Maazleo/Your_Jahez_App',
      technologies: ['Flutter', 'Firebase', 'GetX'],
      category: 'Flutter',
    ),
    Project(
      title: 'Hand Cricket Flutter Game - HeadTails ',
      description: 'A modern, feature-rich hand cricket game built with Flutter. Play against the computer, customize your team, track your stats, and relive the classic hand cricket experience on your device!',
      imageUrl: 'assets/images/jahez.png',
      githubUrl: 'https://github.com/Maazleo/HandCricket-FlutterGame',
      liveUrl: 'https://handcricketgameheadstails.netlify.app/',
      technologies: ['Flutter', 'Firebase', 'SharedPreference'],
      category: 'Flutter',
    ),
    Project(
      title: 'DevTrack Developer-Productivity-Tracker ',
      description: 'DevTrack is a modern productivity tracker built specifically for developers. Whether you are a freelancer, student, or full-time engineer.',
      imageUrl: 'assets/images/jahez.png',
      githubUrl: 'https://github.com/Maazleo/DevTrack-Developer-Productivity-Tracker',
      liveUrl: 'https://devtrackapp.netlify.app/',
      technologies: ['Flutter', 'Firebase', 'GetX'],
      category: 'Flutter',
    ),
    Project(
      title: 'Qr Code Scanner Generator',
      description: 'A Flutter app for scanning and generating QR codes.',
      imageUrl: 'assets/images/jahez.png',
      githubUrl: 'https://github.com/Maazleo/qr-code-scanner-app',
      liveUrl: 'http://qrscanandgenerator.netlify.app',
      technologies: ['Flutter', 'SQLite', 'Charts'],
      category: 'Flutter',
    ),
    Project(
      title: 'PakiFlix-Netflix Clone App',
      description: 'A social networking platform with real-time chat, posts, and user profiles.',
      imageUrl: 'assets/images/projects/social_app.png',
      githubUrl: 'https://github.com/yourusername/social-app',
      technologies: ['Flutter', 'Firebase', 'Cloud Functions'],
      category: 'Flutter',
    ),
    // WEB/REACT PROJECTS
    Project(
      title: '🕌 Namaz Activity Tracker - React.js WebAPP',
      description: 'A modern, feature-rich React web app to help you track your daily prayers, view progress, get smart suggestions, and stay motivated on your spiritual journey. 🌙✨.',
      imageUrl: 'assets/images/jahez.png',
      githubUrl: 'https://github.com/Maazleo/Namaz-Activity-Tracker-React.js-WebAPP.git',
      liveUrl: 'https://trackyournamaz.netlify.app/',
      technologies: ['React.js', 'JavaScript', 'ReCharts','JsPDF','react-leaflet','Axios OpenStreetMap APIs'],
      category: 'Web',
    ),
    Project(
      title: 'get_resume.io - Resume Builder ReactJs App',
      description: 'get_resume.io is a beautiful, modern, and intuitive resume builder web app. Instantly create, preview, and download professional resumes with ease. All your data is saved locally and can be exported as PDF or PNG. Share your resume with a public link and impress recruiters with a stunning, ATS-friendly design.',
      imageUrl: 'assets/images/your_react_portfolio.png', // Add your image to assets/images/
      githubUrl: 'https://github.com/Maazleo/GetResume.io.git',
      liveUrl: 'https://getresumeio.netlify.app/',
      technologies: ['React.js', 'JavaScript', 'CSS', 'Netlify'],
      category: 'Web',
    ),
  ];
} 