import 'package:blog_club/gen/assets.gen.dart';
import 'package:blog_club/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(title: Text('Profile'), actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 16, 0),
              child: IconButton(
                  onPressed: () {}, icon: Icon(Icons.more_horiz_rounded)),
            ),
          ]),
          SliverList(
            delegate: SliverChildListDelegate([
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(32, 16, 32, 32),
                    padding: EdgeInsets.fromLTRB(32, 32, 32, 8),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 20,
                              color: themeData.colorScheme.onBackground
                                  .withOpacity(0.1))
                        ],
                        borderRadius: BorderRadius.circular(32),
                        color: Colors.white),
                    child: Column(children: [
                      Row(
                        children: [
                          Container(
                            width: 84,
                            height: 84,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    colors: [
                                      Color(0xff376AED),
                                      Color(0xff49B0E2),
                                      Color(0xff9CECFB)
                                    ])),
                            child: Container(
                              margin: EdgeInsets.all(2.5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  color: Colors.white),
                              padding: EdgeInsets.all(6),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child: Assets.images.stories.story8
                                    .image(width: 32, height: 32),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '@joviedan',
                                style: themeData.textTheme.bodyMedium,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Jovi Daniel',
                                style: themeData.textTheme.bodyLarge!
                                    .copyWith(fontWeight: FontWeight.w900),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                'UX DEsigner',
                                style: themeData.textTheme.titleSmall!.copyWith(
                                    color: themeData.colorScheme.primary),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'About me',
                              style: themeData.textTheme.headlineMedium,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Madison Blackstone is a director of user experience design, with experience managing global teams.',
                              style: themeData.textTheme.bodyMedium!
                                  .copyWith(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      )
                    ]),
                  ),
                  Positioned(
                      bottom: 0,
                      right: MediaQuery.of(context).size.width / 4,
                      left: MediaQuery.of(context).size.width / 4,
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              blurRadius: 20,
                              color: themeData.colorScheme.onBackground
                                  .withOpacity(0.8))
                        ]),
                      )),
                  Positioned(
                      bottom: 0,
                      right: MediaQuery.of(context).size.width / 5,
                      left: MediaQuery.of(context).size.width / 5,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 68,
                        decoration: BoxDecoration(
                            color: themeData.colorScheme.primary,
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xff2151CD),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '52',
                                        style: themeData
                                            .textTheme.headlineSmall!
                                            .copyWith(
                                                color: themeData
                                                    .colorScheme.surface,
                                                fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'Post',
                                        style: themeData.textTheme.bodyMedium!
                                            .copyWith(
                                                color: themeData
                                                    .colorScheme.surface),
                                      )
                                    ],
                                  ),
                                )),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '250',
                                        style: themeData
                                            .textTheme.headlineSmall!
                                            .copyWith(
                                                color: themeData
                                                    .colorScheme.surface,
                                                fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'Following',
                                        style: themeData.textTheme.bodyMedium!
                                            .copyWith(
                                                color: themeData
                                                    .colorScheme.surface),
                                      )
                                    ],
                                  ),
                                )),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '4.5k',
                                        style: themeData
                                            .textTheme.headlineSmall!
                                            .copyWith(
                                                color: themeData
                                                    .colorScheme.surface,
                                                fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'Followers',
                                        style: themeData.textTheme.bodyMedium!
                                            .copyWith(
                                                color: themeData
                                                    .colorScheme.surface),
                                      )
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    color: themeData.colorScheme.surface,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 20,
                          
                          color: themeData.colorScheme.onBackground
                              .withOpacity(0.2)),
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'My Posts',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                          Assets.images.icons.grid.svg(),
                          SizedBox(width: 16,),
                          Assets.images.icons.table.svg(),
                        ],
                      ),
                    ),
                    PostList(),
                    SizedBox(height: 32,)
                  ],
                ),
              ))
            ]),
          ),
        ],
      ),
    );
  }
}
