import 'package:blog_club/carousel/carousel_slider.dart';
import 'package:blog_club/data.dart';
import 'package:blog_club/gen/assets.gen.dart';
import 'package:blog_club/main.dart';
import 'package:blog_club/screens/article_screen.dart';
import 'package:blog_club/screens/stroy_screen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    final stories = AppDatabase.stories;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
                      Assets.images.icons.notification.path,
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
              _Stories(stories: stories, themeData: themeData),
              SizedBox(
                height: 4,
              ),
              _CategoryList(),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Lastest News',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'More',
                        ))
                  ],
                ),
              ),
              PostList(),
              SizedBox(
                height: 32,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList();

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
        padding: EdgeInsets.only(right: 16, left: 32),
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
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => StoryScreen(),
        ));
      },
      child: Column(
        children: [
          Stack(
            children: [
              story.isViewed
                  ? _profileImageVisited()
                  : _profileImageNotVisited(),
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
      ),
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

class PostList extends StatelessWidget {
  final posts = AppDatabase.posts;

  PostList({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 141,
      itemCount: posts.length,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        final post = posts[index];
        return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ArticleScreen(),
              ));
            },
            child: Post(post: post));
      },
    );
  }
}

class Post extends StatelessWidget {
  const Post({
    super.key,
    required this.post,
  });

  final PostData post;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(32, 8, 32, 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Color(0x1a5282FF), blurRadius: 25)],
      ),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                  'assets/images/posts/small/${post.imageFileName}')),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.caption,
                    style: const TextStyle(
                        fontFamily: MyApp.fontFamilyDefualt,
                        color: MyApp.primaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 14),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    post.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        CupertinoIcons.hand_thumbsup,
                        size: 16,
                        color: Theme.of(context).textTheme.bodySmall!.color,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        post.likes,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Icon(
                        CupertinoIcons.clock,
                        size: 16,
                        color: Theme.of(context).textTheme.bodySmall!.color,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        post.time,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Expanded(
                          child: Container(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          post.isBookmarked
                              ? CupertinoIcons.bookmark_fill
                              : CupertinoIcons.bookmark,
                          size: 16,
                          color: MyApp.primaryColor,
                        ),
                      ))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
