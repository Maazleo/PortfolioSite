# Flutter Developer Portfolio

A modern, responsive Flutter web portfolio for showcasing your skills, projects, and achievements as a Flutter developer.

## Features

- 📱 Fully responsive design that works on all devices
- 🎨 Modern UI with smooth animations and transitions
- 🌙 Dark theme with a professional color scheme
- 📝 Sections for showcasing your skills, projects, experience, and more
- 🔗 Social media integration
- 📬 Contact form for potential clients or employers
- 🚀 Easy deployment to Netlify

## Screenshots

(Add screenshots of your portfolio here)

## Getting Started

### Prerequisites

- Flutter SDK (latest version recommended)
- Dart SDK (latest version recommended)
- Git

### Installation

1. Clone the repository:

```bash
git clone https://github.com/yourusername/portfolio_web.git
cd portfolio_web
```

2. Install dependencies:

```bash
flutter pub get
```

3. Run the app:

```bash
flutter run -d chrome
```

## Customization

### Personal Information

Update your personal information in the following files:

- `lib/constants/app_constants.dart`: Update social links, section titles, etc.
- Replace profile image in `assets/images/profile.png`
- Update project details in `lib/models/project_model.dart`
- Update experience details in `lib/models/experience_model.dart`
- Update education details in `lib/models/education_model.dart`
- Update skills in `lib/models/education_model.dart` (Skill class)

### Theme Colors

You can customize the theme colors in `lib/constants/app_constants.dart`:

```dart
class AppColors {
  static const Color primaryColor = Color(0xFF0A192F); // Dark blue
  static const Color secondaryColor = Color(0xFF64FFDA); // Teal accent
  // ... other colors
}
```

## Deployment

### Deploying to Netlify

1. Build the web version:

```bash
flutter build web --release
```

2. Deploy to Netlify:

- Sign up for a [Netlify](https://www.netlify.com/) account
- Drag and drop the `build/web` folder to Netlify, or
- Connect your GitHub repository and configure the build settings:
  - Build command: `flutter build web --release`
  - Publish directory: `build/web`

A `netlify.toml` file is already included in the repository with the correct configuration.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Flutter team for the amazing framework
- All the package authors used in this project
