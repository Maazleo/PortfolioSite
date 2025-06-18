import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'constants/app_constants.dart';
import 'screens/about_section.dart';
import 'screens/achievements_section.dart';
import 'screens/education_section.dart';
import 'screens/experience_section.dart';
import 'screens/contact_section.dart';
import 'screens/freelancing_section.dart';
import 'screens/home_section.dart';
import 'screens/projects_section.dart';
import 'screens/skills_section.dart';
import 'widgets/footer.dart';
import 'widgets/navbar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maaz - Flutter Developer Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.bgPrimary,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.primaryColor,
          secondary: AppColors.secondaryColor,
        ),
        useMaterial3: true,
      ),
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 576, name: MOBILE),
          const Breakpoint(start: 577, end: 768, name: TABLET),
          const Breakpoint(start: 769, end: 1200, name: DESKTOP),
          const Breakpoint(start: 1201, end: double.infinity, name: '4K'),
        ],
      ),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  late ScrollController _scrollController;
  final FocusNode _focusNode = FocusNode();
  int _currentIndex = 0;
  final List<GlobalKey> _sectionKeys = List.generate(9, (_) => GlobalKey());

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_updateCurrentIndexOnScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateCurrentIndexOnScroll);
    _scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _updateCurrentIndexOnScroll() {
    // Find which section is currently most visible
    final scrollPosition = _scrollController.position.pixels;
    int newIndex = 0;
    
    // Find the section that's most visible in the viewport
    for (int i = 0; i < _sectionKeys.length; i++) {
      final key = _sectionKeys[i];
      final context = key.currentContext;
      if (context != null) {
        final renderBox = context.findRenderObject() as RenderBox;
        final position = renderBox.localToGlobal(Offset.zero);
        // If the section is visible in the viewport
        if (position.dy < MediaQuery.of(context).size.height / 2 && 
            position.dy > -renderBox.size.height / 2) {
          newIndex = i;
          break;
        }
      }
    }
    
    if (newIndex != _currentIndex) {
      setState(() {
        _currentIndex = newIndex;
      });
    }
  }

  void _scrollToSection(int index) {
    setState(() {
      _currentIndex = index;
    });
    
    // Find the section's position
    final sectionContext = _sectionKeys[index].currentContext;
    if (sectionContext != null) {
      Scrollable.ensureVisible(
        sectionContext,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _handleKeyEvent(RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      const scrollAmount = 100.0;
      
      if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
        _scrollController.animateTo(
          _scrollController.position.pixels + scrollAmount,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
        _scrollController.animateTo(
          _scrollController.position.pixels - scrollAmount,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      } else if (event.logicalKey == LogicalKeyboardKey.pageDown) {
        _scrollController.animateTo(
          _scrollController.position.pixels + MediaQuery.of(context).size.height * 0.8,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else if (event.logicalKey == LogicalKeyboardKey.pageUp) {
        _scrollController.animateTo(
          _scrollController.position.pixels - MediaQuery.of(context).size.height * 0.8,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else if (event.logicalKey == LogicalKeyboardKey.home) {
        _scrollController.animateTo(
          0.0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else if (event.logicalKey == LogicalKeyboardKey.end) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: _focusNode,
      onKey: _handleKeyEvent,
      autofocus: true,
      child: Scaffold(
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Stack(
            children: [
              Positioned.fill(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      // Add padding to prevent content from being hidden under the navbar
                      SizedBox(height: MediaQuery.of(context).padding.top + 60),
                      _buildSection(0, HomeSection(
                        onExploreClicked: () => _scrollToSection(1),
                        onContactClicked: () => _scrollToSection(8),
                      )),
                      _buildSection(1, const AboutSection()),
                      _buildSection(2, const ExperienceSection()),
                      _buildSection(3, const ProjectsSection()),
                      _buildSection(4, const SkillsSection()),
                      _buildSection(5, const EducationSection()),
                      _buildSection(6, const AchievementsSection()),
                      _buildSection(7, const FreelancingSection()),
                      _buildSection(8, const ContactSection()),
                      const Footer(),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Material(
                  color: Colors.transparent,
                  child: NavBar(
                    currentIndex: _currentIndex,
                    onNavItemClicked: _scrollToSection,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(int index, Widget child) {
    return Container(
      key: _sectionKeys[index],
      child: child,
    );
  }
}
