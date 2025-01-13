import 'package:blog_club/data.dart';
import 'package:blog_club/main.dart';
import 'package:blog_club/screens/article_screen.dart';
import 'package:blog_club/screens/home_screen.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class StoryScreen extends StatelessWidget {
  const StoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    final stories = AppDatabase.onStoryItems;
    final PageController _pageController = PageController();
    return Scaffold(
      backgroundColor: themeData.colorScheme.primary,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32))),
              child: PageView.builder(
                controller: _pageController,
                itemCount: stories.length,
                itemBuilder: (context, index) {
                  var story = stories[index];
                  return _StoryContent(
                      story: story,
                      pageController: _pageController,
                      stories: stories,
                      themeData: themeData);
                },
              ),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      elevation: WidgetStatePropertyAll(0),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                      backgroundColor: WidgetStatePropertyAll(
                          themeData.colorScheme.surface)),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ArticleScreen(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Read More',
                      style: themeData.textTheme.bodyLarge!
                          .apply(color: themeData.colorScheme.primary),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 16,
                ),
                Padding(
                  padding: const EdgeInsets.all(32),
                  child: _StoryLike(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _StoryContent extends StatelessWidget {
  const _StoryContent({
    super.key,
    required this.story,
    required PageController pageController,
    required this.stories,
    required this.themeData,
  }) : _pageController = pageController;

  final OnStoryItem story;
  final PageController _pageController;
  final List<OnStoryItem> stories;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32)),
          child: Image.asset(
            'assets/images/background/${story.imagePath}',
            fit: BoxFit.cover,
          ),
        )),
        Positioned.fill(
          right: 0,
          left: 0,
          top: 0,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32))),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: stories.length,
                    effect: SlideEffect(
                        dotHeight: 4,
                        dotWidth: 93,
                        activeDotColor: themeData.colorScheme.surface,
                        dotColor: Colors.white24),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/images/stories/${story.storyData.imageFileName}',
                          width: 54,
                          height: 54,
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              story.storyData.name,
                              style: themeData.textTheme.bodyLarge!
                                  .apply(color: Colors.white),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              '4m ago',
                              style: themeData.textTheme.bodyMedium!
                                  .apply(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).canPop()
                                ? Navigator.of(context).pop()
                                : Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                    builder: (context) => MainScreen(),
                                  ));
                          },
                          icon: Icon(
                            CupertinoIcons.xmark,
                            color: themeData.colorScheme.surface,
                            size: 28,
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 32,
            right: 32,
            left: 32,
            child: BlurryContainer(
              blur: 6,
              color: Color.fromRGBO(140, 140, 140, 0.1),
              borderRadius: BorderRadius.circular(24),
              padding: EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    story.title,
                    style: themeData.textTheme.headlineMedium!
                        .apply(color: themeData.colorScheme.surface),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    story.description,
                    style: themeData.textTheme.bodyMedium!.copyWith(
                        color: themeData.colorScheme.surface.withOpacity(0.8),
                        fontSize: 18),
                  ),
                ],
              ),
            ))
      ],
    );
  }
}

class _StoryLike extends StatefulWidget {
  const _StoryLike({
    super.key,
  });

  @override
  State<_StoryLike> createState() => _StoryLikeState();
}

class _StoryLikeState extends State<_StoryLike> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              setState(() {
                isLiked = !isLiked;
              });
            },
            icon: Icon(
              isLiked ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
              color: Colors.red,
              size: 42,
            )),
        SizedBox(
          height: 8,
        ),
        Text(
          '450k',
          style:
              Theme.of(context).textTheme.bodyLarge!.apply(color: Colors.white),
        )
      ],
    );
  }
}
