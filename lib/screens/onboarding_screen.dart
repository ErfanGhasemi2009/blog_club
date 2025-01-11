import 'package:blog_club/data.dart';
import 'package:blog_club/gen/assets.gen.dart';
import 'package:blog_club/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  final items = AppDatabase.onBoardingItems;
  int page = 0;
  @override
  void initState() {
    _pageController.addListener(
      () {
        if (_pageController.page!.round() != page) {
          setState(() {
            page = _pageController.page!.round();
          });
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.colorScheme.background,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Assets.images.background.onboarding.image(),
          )),
          Container(
            height: MediaQuery.of(context).size.height / 2.8,
            decoration: BoxDecoration(
                color: themeData.colorScheme.surface,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(48),
                    topRight: Radius.circular(48)),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 20, color: Colors.black.withOpacity(0.1))
                ]),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: items.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(32, 48, 32, 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              items[index].title,
                              style: themeData.textTheme.headlineLarge,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              items[index].description,
                              style: themeData.textTheme.bodyMedium,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 4, 32, 16),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmoothPageIndicator(
                          controller: _pageController,
                          count: items.length,
                          effect: ExpandingDotsEffect(
                              dotHeight: 8,
                              dotWidth: 8,
                              activeDotColor: themeData.colorScheme.primary,
                              dotColor: themeData.colorScheme.primary
                                  .withOpacity(0.1)),
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                minimumSize: const WidgetStatePropertyAll(
                                  Size(88, 60),
                                ),
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)))),
                            onPressed: () {
                              if (page == items.length - 1) {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ));
                              } else {
                                _pageController.animateToPage(page+1,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeInToLinear);
                              }
                            },
                            child: Icon(
                              page == items.length - 1
                                  ? CupertinoIcons.checkmark_alt
                                  : CupertinoIcons.arrow_right,
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
