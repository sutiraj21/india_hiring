import 'package:flutter/material.dart';
import 'package:inidiahiringg/Utils/Routes/Routes_Name.dart';
import 'package:inidiahiringg/View/Login_Screen.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}
class _OnboardingScreenState extends State<OnboardingScreen> {
  late TutorialCoachMark tutorialCoachMark;
  List<TargetFocus> targets = [];
  final PageController _pageController = PageController();
  int currentPage = 0;

  final GlobalKey _welcomeTextKey = GlobalKey();
  final GlobalKey _applyButtonKey = GlobalKey();
  final GlobalKey _jobListKey = GlobalKey();
  final GlobalKey _savedJobsKey = GlobalKey();
  final GlobalKey _profileKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int newPage = _pageController.page?.round() ?? 0;
      if (newPage != currentPage) {
        currentPage = newPage;
        Future.delayed(Duration(milliseconds: 500), showTutorial);
      }
    });

    Future.delayed(Duration(milliseconds: 500), showTutorial);
  }

  void showTutorial() {
    targets.clear();
    if (currentPage == 0) {
      targets.addAll([
        TargetFocus(
          identify: "WelcomeText",
          keyTarget: _welcomeTextKey,
          color: Colors.white,
          borderSide: BorderSide(color: Colors.blue),
          contents: [
            TargetContent(
              align: ContentAlign.bottom,
              child: Text(
                "Welcome to IndiaHiring! Explore jobs easily.",
                style: TextStyle(color: Colors.blueGrey, fontSize: 16),
              ),
            )
          ],
        ),
        TargetFocus(
          identify: "JobList",
          keyTarget: _jobListKey,
          color: Colors.white,
          borderSide: BorderSide(color: Colors.blue),
          contents: [
            TargetContent(
              align: ContentAlign.top,
              child: Text(
                "Here are some job listings. Click to explore more details.",
                style: TextStyle(color: Colors.blueGrey, fontSize: 16),
              ),
            )
          ],
        ),
        TargetFocus(
          identify: "ApplyButton",
          keyTarget: _applyButtonKey,
          color: Colors.white,
          borderSide: BorderSide(color: Colors.blue),
          contents: [
            TargetContent(
              align: ContentAlign.top,
              child: Text(
                "Tap here to apply for jobs quickly!",
                style: TextStyle(color: Colors.blueGrey, fontSize: 16),
              ),
            )
          ],
        ),
      ]
      );
    } else if (currentPage == 1) {
      targets.addAll([
        TargetFocus(
          identify: "Profile",
          keyTarget: _profileKey,
          color: Colors.white,

          borderSide: BorderSide(color: Colors.blue),
          contents: [
            TargetContent(
              align: ContentAlign.bottom,
              child: Text(
                "This is your profile. Keep it updated for better recommendations.",
                style: TextStyle(color: Colors.blueGrey, fontSize: 16),
              ),
            )
          ],
        ),
        TargetFocus(
          identify: "SavedJobs",
          keyTarget: _savedJobsKey,
          color: Colors.white,
          borderSide: BorderSide(color: Colors.blue),
          contents: [
            TargetContent(
              align: ContentAlign.top,
              child: Text(
                "Find your saved jobs here and apply later.",
                style: TextStyle(color: Colors.blueGrey, fontSize: 16),
              ),
            )
          ],
        ),
      ]);
    }

    if (targets.isNotEmpty) {
      tutorialCoachMark = TutorialCoachMark(
        targets: targets,
        colorShadow: Colors.black54,
        textSkip: "SKIP",
        paddingFocus: 8,
        onFinish: () => print("Tutorial Finished!"),
      )..show(context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              buildPage1(),
              buildPage2(),
            ],
          ),
          Positioned(
            bottom: 80,
            left: MediaQuery.of(context).size.width * 0.44,
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 2,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.blue,
                dotHeight: 8,
                dotWidth: 8,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            key: _applyButtonKey,
            child: Container(
              height: 50,
              width: 100,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context,RoutesName.login);
                  if (currentPage == 0) {
                    _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                  } else {
                    // Navigate to next screen
                  }
                },
                child: Text(
                  "Next",
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(backgroundColor: Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPage1() {
    return Stack(
      children: [

        Positioned(
          top: 50,
          left: 20,
          child: Text(
            "IndiaHiring!",
            key: _welcomeTextKey,
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueAccent),
          ),
        ),
        Positioned(
          bottom: 180,
          left: 10,
          child: Container(
            key: _jobListKey,
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  "Easy To Apply",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 0),
                Text(
                  "\nSoftware Developer - Google , Data Analyst - Microsoft\nFlutter , Java , Python",
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 200,
          left: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(300),
            child: Container(
              height: 300,
              width: 300,
              key: _savedJobsKey,
              padding: EdgeInsets.all(12),
              child: Lottie.asset("assets/on1.json", fit: BoxFit.fill),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPage2() {
    return Stack(
      children: [
        Positioned(
          top: 50,
          left: 20,
          child: Text(
            "IndiaHiring",
            key: _profileKey,
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueAccent),
          ),
        ),
        Positioned(
          bottom: 180,
          left: 40,
          child: Container(
            key: _savedJobsKey,
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  "Recommendations",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text("Get personalized job suggestions based\n              on your skills & interests."),
              ],
            ),
          ),
        ),
        Positioned(
          top: 200,
          left: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(300),
            child: Container(
              height: 300,
              width: 300,
              padding: EdgeInsets.all(12),
              child: Lottie.asset("assets/on1.json", fit: BoxFit.fill),
            ),
          ),
        ),
      ],
    );
  }
}
