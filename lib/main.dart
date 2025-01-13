import 'package:blog_club/screens/article_screen.dart';
import 'package:blog_club/screens/home_screen.dart';
import 'package:blog_club/screens/profile_screen.dart';
import 'package:blog_club/screens/splash_screen.dart';
import 'package:blog_club/screens/stroy_screen.dart';
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
            elevation: 0,
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
      // home: Stack(
      //   children: [
      //     Positioned.fill(child: const HomeScreen()),
      //     Positioned(
      //       bottom: 0,
      //       right: 0,
      //       left: 0,
      //       child: _BottomNavigation(),
      //     )
      //   ],
      // ),
      home: SplashScreen(),
    );
  }
}

const int homeScreenIndex = 0;
const int articleScreenIndex = 1;
const int searchScreenIndex = 2;
const int menuScreenIndex = 3;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              bottom: 65,
              child: IndexedStack(
                index: selectedIndex,
                children: [
                  HomeScreen(),
                  ArticleScreen(),
                  StoryScreen(),
                  ProfileScreen()
                ],
              )),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: _BottomNavigation(
                onIndexTap: (int index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                selectedTabIndex: selectedIndex,
              ))
        ],
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  final Function(int index) onIndexTap;
  final int selectedTabIndex;

  const _BottomNavigation(
      {required this.onIndexTap, required this.selectedTabIndex});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Stack(
        children: [
          Stack(
            children: [
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: 65,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _BottomNavigationItem(
                        iconPath: 'Home.png',
                        title: 'Home',
                        activieIconPath: 'Home.png',
                        onTap: () {
                          onIndexTap(homeScreenIndex);
                        },
                        isActive: selectedTabIndex == homeScreenIndex,
                      ),
                      _BottomNavigationItem(
                          iconPath: 'Articles.png',
                          title: 'Articles',
                          activieIconPath: 'Articles.png',
                          onTap: () {
                            onIndexTap(articleScreenIndex);
                          },
                          isActive: selectedTabIndex == articleScreenIndex),
                      Expanded(child: Container()),
                      _BottomNavigationItem(
                          iconPath: 'Search.png',
                          title: 'Search',
                          activieIconPath: 'Search.png',
                          onTap: () {
                            onIndexTap(searchScreenIndex);
                          },
                          isActive: selectedTabIndex == searchScreenIndex),
                      _BottomNavigationItem(
                          iconPath: 'Menu.png',
                          title: 'Menu',
                          activieIconPath: 'Mune.png',
                          onTap: () {
                            onIndexTap(menuScreenIndex);
                          },
                          isActive: selectedTabIndex == menuScreenIndex),
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 65,
                  height: 85,
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32.5),
                        color: MyApp.primaryColor,
                        border: Border.all(color: Colors.white, width: 6)),
                    child: Image.asset('assets/images/icons/plus.png'),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _BottomNavigationItem extends StatelessWidget {
  final String iconPath;
  final String activieIconPath;
  final String title;
  final bool isActive;
  final Function() onTap;

  const _BottomNavigationItem(
      {required this.iconPath,
      required this.title,
      required this.activieIconPath,
      required this.onTap,
      required this.isActive});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            SizedBox(
              height: 4,
            ),
            Image.asset('assets/images/icons/$iconPath'),
            Text(
              title,
              style: Theme.of(context).textTheme.displaySmall!.apply(
                  color: isActive
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).textTheme.displaySmall!.color),
            )
          ],
        ),
      ),
    );
  }
}
