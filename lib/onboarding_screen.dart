import 'package:flutter/material.dart';
import 'login_page.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController();
  int currentPage = 0;

  // List of onboarding data
  final List<OnboardingData> onboardingPages = [
    OnboardingData(
      imagePath: 'images/dizzy-man-with-fruits-and-vegetables-living-a-healthy-life.png',
      title: 'Welcome to Nutrition App',
      description: 'Plan your meals, track your progress, and achieve your goals.',
    ),
    OnboardingData(
      imagePath: 'images/undraw_breakfast_psiw.png',
      title: 'Personalized Plans',
      description: 'Get custom meal suggestions based on your personal health data.',
    ),
    OnboardingData(
      imagePath: 'images/6 - Copy.png',
      title: 'Track Your Progress',
      description: 'Monitor your weight and nutritional intake every day!',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, // Background color
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: onboardingPages.length,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return buildOnboardingPage(onboardingPages[index]);
              },
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(onboardingPages.length, (index) {
                      return buildDot(index, currentPage);
                    }),
                  ),
                  SizedBox(height: 20),
                  currentPage == onboardingPages.length - 1
                      ? ElevatedButton(
                    onPressed: () {
                      // Navigate to LoginPage after onboarding
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text(
                      "Get Started",
                      style: TextStyle(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange, // Button color
                      padding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 64.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  )
                      : TextButton(
                    onPressed: () {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(fontSize: 16, color: Colors.orange),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to build each onboarding page
  Widget buildOnboardingPage(OnboardingData data) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Animated Image
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            child: Image.asset(data.imagePath, height: 300),
          ),
          SizedBox(height: 40),
          // Animated Title
          AnimatedOpacity(
            opacity: 1.0,
            duration: Duration(milliseconds: 800),
            child: Text(
              data.title,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          // Animated Description
          AnimatedOpacity(
            opacity: 1.0,
            duration: Duration(milliseconds: 1000),
            child: Text(
              data.description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }

  // Method to build dots indicator
  Widget buildDot(int index, int currentIndex) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 10,
      width: currentIndex == index ? 20 : 10,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: currentIndex == index ? Colors.orange : Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

// Model for onboarding data
class OnboardingData {
  final String imagePath;
  final String title;
  final String description;

  OnboardingData({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}
