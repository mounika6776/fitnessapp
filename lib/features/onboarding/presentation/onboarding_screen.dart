import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  static const _pages = [
    _OnboardingPageData(
      icon: Icons.fitness_center_rounded,
      title: 'Train Your Way',
      description:
          'Track your workouts and martial arts training in one place.',
    ),
    _OnboardingPageData(
      icon: Icons.restaurant_rounded,
      title: 'Fuel Your Progress',
      description: 'Log your meals and follow your daily nutrition goals.',
    ),
    _OnboardingPageData(
      icon: Icons.insights_rounded,
      title: 'See Your Transformation',
      description:
          'Follow your body measurements, photos, and fitness milestones.',
    ),
  ];

  bool get _isLastPage => _currentPage == _pages.length - 1;

  void _next() {
    if (_isLastPage) {
      _getStarted();
      return;
    }

    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _getStarted() {
    // Connect the login / registration screen here when it is ready.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Login / registration will be connected next.'),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                itemBuilder: (context, index) {
                  return _OnboardingPage(data: _pages[index]);
                },
              ),
            ),

            // Page indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 28 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? AppColors.primary
                        : AppColors.border,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 28),

            // Bottom button
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 480),
                  child: SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: _next,
                      child: Text(_isLastPage ? 'Get Started' : 'Next'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingPageData {
  final IconData icon;
  final String title;
  final String description;

  const _OnboardingPageData({
    required this.icon,
    required this.title,
    required this.description,
  });
}

class _OnboardingPage extends StatelessWidget {
  final _OnboardingPageData data;

  const _OnboardingPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(48),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Icon(data.icon, size: 88, color: AppColors.primary),
                  ),
                  const SizedBox(height: 48),
                  Text(
                    data.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.text,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 360),
                    child: Text(
                      data.description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.muted,
                        fontSize: 16,
                        height: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
// class 
//  extends StatefulWidget {
//   const 
//   ({super.key});

//   @override
//   State<
//   > createState() => _
//   State();
// }

// class _
// State extends State<
// > {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
//this is sample