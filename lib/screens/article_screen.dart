import 'package:blog_club/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  bool isLiked = false;
  bool isBookmarked = false;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          setState(() {
            if (isLiked) {
              showSnackBar(context, 'You disliked this article');
            } else {
              showSnackBar(context, 'You liked this article');
            }
            isLiked = !isLiked;
          });
        },
        child: Container(
          width: 111,
          height: 48,
          decoration: BoxDecoration(
              color: themeData.colorScheme.primary,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    color: themeData.colorScheme.primary,
                    blurRadius: 15,
                    spreadRadius: 2)
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isLiked
                    ? CupertinoIcons.hand_thumbsup_fill
                    : CupertinoIcons.hand_thumbsup,
                color: Colors.white,
                size: 20,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                textAlign: TextAlign.center,
                '2.1k',
                style: themeData.textTheme.bodyLarge!
                    .copyWith(color: Colors.white),
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(title: Text('Article'), actions: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 16, 0),
                  child: IconButton(
                      onPressed: () {}, icon: Icon(Icons.more_horiz_rounded)),
                )
              ]),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                      child: Text(
                        'Four Things Every Woman Needs To Know',
                        style: themeData.textTheme.headlineLarge,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 16, 16, 24),
                      child: Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Assets.images.stories.story1
                                  .image(width: 52, height: 52)),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Richard Gervain',
                                  style: themeData.textTheme.titleSmall!
                                      .copyWith(fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '2m ago',
                                  style: themeData.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () async {
                                await Share.share(
                                    'Hello, this article is amazing!');
                              },
                              icon: Icon(
                                CupertinoIcons.share,
                                color: themeData.colorScheme.primary,
                              )),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (isBookmarked) {
                                    showSnackBar(context,
                                        'You unbookmarked this article');
                                  } else {
                                    showSnackBar(
                                        context, 'You bookmarked this article');
                                  }
                                  isBookmarked = !isBookmarked;
                                });
                              },
                              icon: Icon(
                                isBookmarked
                                    ? CupertinoIcons.bookmark_fill
                                    : CupertinoIcons.bookmark,
                                color: themeData.colorScheme.primary,
                              ))
                        ],
                      ),
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(32),
                            topLeft: Radius.circular(32)),
                        child: Assets.images.background.singlePost.image()),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 48, 32, 72),
                      child: Column(
                        children: [
                          Text(
                            'A man’s sexuality is never your mind responsibility.',
                            style: themeData.textTheme.headlineMedium,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            'This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.',
                            style: themeData.textTheme.bodyMedium,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 116,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: AlignmentDirectional.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.white, Colors.white.withOpacity(0)])),
            ),
          ),
        ],
      ),
    );
  }
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    duration: Duration(seconds: 1),
  ));
}
