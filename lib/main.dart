import 'package:blog_club/carousel/carousel_slider.dart';
import 'package:blog_club/data.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String fontFamilyDefualt = "Avenir";
  static const Color primaryTextColor = Color(0xff0D253C);
  static const Color secondryTextColor = Color(0xff2D4379);
  static const Color primaryColor = Color(0xff376AED);

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog Club',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textButtonTheme: const TextButtonThemeData(
            style: ButtonStyle(
                textStyle: WidgetStatePropertyAll(
          TextStyle(
              fontFamily: fontFamilyDefualt,
              color: primaryColor,
              fontWeight: FontWeight.w400,
              fontSize: 14),
        ))),
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
          onPrimary: Colors.white,
          background: Color(0xffFbFCFF),
          surface: Colors.white,
          onSurface: primaryTextColor,
          onBackground: primaryTextColor,
        ),
        appBarTheme: AppBarTheme(
            color: Theme.of(context).colorScheme.surface,
            titleSpacing: 32,
            foregroundColor: Theme.of(context).colorScheme.onBackground),
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: primaryColor,
        ),
        useMaterial3: false,
        textTheme: const TextTheme(
            bodyLarge: TextStyle(
                fontFamily: fontFamilyDefualt,
                color: secondryTextColor,
                fontWeight: FontWeight.w700,
                fontSize: 18),
            bodyMedium: TextStyle(
                color: secondryTextColor,
                fontFamily: fontFamilyDefualt,
                fontSize: 14),
            titleSmall: TextStyle(
                fontFamily: fontFamilyDefualt,
                color: secondryTextColor,
                fontWeight: FontWeight.w400,
                fontSize: 18),
            headlineLarge: TextStyle(
                color: primaryTextColor,
                fontFamily: fontFamilyDefualt,
                fontSize: 24,
                fontWeight: FontWeight.w900),
            bodySmall: TextStyle(
                color: secondryTextColor,
                fontFamily: fontFamilyDefualt,
                fontSize: 12),
            labelSmall: TextStyle(
                fontFamily: fontFamilyDefualt,
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700),
            headlineMedium: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: primaryTextColor,
                fontFamily: fontFamilyDefualt),
            titleMedium: TextStyle(
                fontFamily: fontFamilyDefualt,
                color: primaryTextColor,
                fontWeight: FontWeight.w400,
                fontSize: 14),
            displaySmall: TextStyle(
                fontFamily: fontFamilyDefualt,
                fontWeight: FontWeight.w700,
                fontSize: 10,
                color: secondryTextColor)),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    final stories = AppDatabase.stories;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 32, left: 32, top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hi, Jonathan!',
                      style: themeData.textTheme.titleSmall,
                    ),
                    Image.asset(
                      'assets/images/icons/notification.png',
                      width: 32,
                      height: 32,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 8, 32, 16),
                child: Text(
                  'Explore today’s',
                  style: themeData.textTheme.headlineLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: _Stories(stories: stories, themeData: themeData),
              ),
              SizedBox(
                height: 16,
              ),
              _CategoryList()
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categories = AppDatabase.categories;
    return CarouselSlider.builder(
        itemCount: categories.length,
        itemBuilder: (context, index, realIndex) {
          return _CategoryItem(
              left: realIndex == 0 ? 32 : 8,
              right: realIndex == categories.length - 1 ? 32 : 8,
              category: categories[realIndex]);
        },
        options: CarouselOptions(
            scrollDirection: Axis.horizontal,
            viewportFraction: 0.8,
            aspectRatio: 1.2,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            scrollPhysics: const BouncingScrollPhysics(),
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            disableCenter: true));
  }
}

class _CategoryItem extends StatelessWidget {
  final double left;
  final double right;
  final Category category;
  const _CategoryItem({
    super.key,
    required this.category,
    required this.left,
    required this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(left, 0, right, 0),
      child: Stack(children: [
        Positioned.fill(
          top: 100,
          right: 65,
          left: 65,
          bottom: 24,
          child: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(119, 13, 37, 60), blurRadius: 20)
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            margin: const EdgeInsets.fromLTRB(8, 0, 8, 16),
            decoration: BoxDecoration(
                color: Colors.orange, borderRadius: BorderRadius.circular(24)),
            foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [Color(0xff0D253C), Colors.transparent])),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                'assets/images/posts/large/${category.imageFileName}',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 48,
            left: 56,
            child: Text(
              category.title,
              style: Theme.of(context).textTheme.labelSmall,
            ))
      ]),
    );
  }
}

class _Stories extends StatelessWidget {
  const _Stories({
    required this.stories,
    required this.themeData,
  });

  final List<StoryData> stories;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 110,
      child: ListView.builder(
        itemCount: stories.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(right: 16),
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final story = stories[index];
          return _Story(story: story, themeData: themeData);
        },
      ),
    );
  }
}

class _Story extends StatelessWidget {
  const _Story({
    required this.story,
    required this.themeData,
  });

  final StoryData story;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            story.isViewed ? _profileImageVisited() : _profileImageNotVisited(),
            Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/icons/${story.iconFileName}',
                  width: 28,
                  height: 28,
                ))
          ],
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          story.name,
          style: themeData.textTheme.bodySmall,
        )
      ],
    );
  }

  Widget _profileImageNotVisited() {
    return Container(
      margin: EdgeInsets.all(4),
      width: 68,
      height: 68,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(begin: Alignment.topLeft, colors: [
            Color(0xff376AED),
            Color(0xff49B0E2),
            Color(0xff9CECFB)
          ])),
      child: Container(
        margin: EdgeInsets.all(2.5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22), color: Colors.white),
        padding: EdgeInsets.all(4),
        child: _profileImage(),
      ),
    );
  }

  Widget _profileImageVisited() {
    return Container(
      margin: EdgeInsets.all(4),
      width: 67,
      height: 67,
      child: DottedBorder(
        borderType: BorderType.RRect,
        strokeWidth: 2,
        dashPattern: [8, 3],
        color: const Color(0xff7B8BB2),
        radius: const Radius.circular(24),
        padding: const EdgeInsets.all(6),
        child: Container(
          child: _profileImage(),
        ),
      ),
    );
  }

  Widget _profileImage() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset('assets/images/stories/${story.imageFileName}'));
  }
}
