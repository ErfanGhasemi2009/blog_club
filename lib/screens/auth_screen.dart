import 'package:blog_club/gen/assets.gen.dart';
import 'package:blog_club/main.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const int loginTab = 0;
  static const int signUpTab = 1;
  int selectedTab = loginTab;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    final tabTextTheme = TextStyle(
        color: themeData.colorScheme.onPrimary,
        fontFamily: "Avenir",
        fontWeight: FontWeight.w700,
        fontSize: 18);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 24, 32, 24),
            child: Assets.images.icons.logo.svg(width: 120),
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: themeData.colorScheme.primary,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32))),
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          onPressed: () {
                            setState(() {
                              if (selectedTab != loginTab) {
                                selectedTab = loginTab;
                              }
                            });
                          },
                          child: Text(
                            'login'.toUpperCase(),
                            style: tabTextTheme.apply(
                                color: selectedTab == loginTab
                                    ? Colors.white
                                    : Colors.white54),
                          )),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            if (selectedTab != signUpTab) {
                              selectedTab = signUpTab;
                            }
                          });
                        },
                        child: Text(
                          'Sign up'.toUpperCase(),
                          style: tabTextTheme.apply(
                              color: selectedTab == signUpTab
                                  ? Colors.white
                                  : Colors.white54),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      color: themeData.colorScheme.surface,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32))),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(32, 48, 32, 16),
                      child: selectedTab == loginTab
                          ? _LoginTab(themeData: themeData)
                          : _SignUpTab(themeData: themeData),
                    ),
                  ),
                ))
              ],
            ),
          ))
        ],
      )),
    );
  }
}

class _LoginTab extends StatelessWidget {
  const _LoginTab({
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome back',
          style: themeData.textTheme.headlineLarge,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          'sign in with your account',
          style: themeData.textTheme.bodyMedium,
        ),
        SizedBox(
          height: 32,
        ),
        _NormalTextField(
          themeData: themeData,
          label: 'Username',
        ),
        SizedBox(
          height: 8,
        ),
        _PasswordTextField(themeData: themeData),
        _ElavetedButtonLoginSignUp(
          bottomLabel: 'login',
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Forgot your password?'),
            SizedBox(
              width: 8,
            ),
            TextButton(onPressed: () {}, child: Text('Reset here'))
          ],
        ),
        SizedBox(
          height: 32,
        ),
        Center(
          child: Text(
            'or sign in with'.toUpperCase(),
            style: TextStyle(letterSpacing: 2),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        _AuthWithIcons()
      ],
    );
  }
}

class _SignUpTab extends StatelessWidget {
  const _SignUpTab({
    required this.themeData,
  });

  final ThemeData themeData;
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome to blog club',
          style: themeData.textTheme.headlineLarge,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          'Please enter your informaiton',
          style: themeData.textTheme.bodyMedium,
        ),
        SizedBox(
          height: 32,
        ),
        _NormalTextField(
          themeData: themeData,
          label: 'Fullname',
        ),
        _NormalTextField(
          themeData: themeData,
          label: 'Username',
        ),
        SizedBox(
          height: 8,
        ),
        _PasswordTextField(themeData: themeData),
        _ElavetedButtonLoginSignUp(
          bottomLabel: 'sign up',
        ),
        SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 32,
        ),
        Center(
          child: Text(
            'or sign up with'.toUpperCase(),
            style: TextStyle(letterSpacing: 2),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        _AuthWithIcons()
      ],
    );
  }
}

class _AuthWithIcons extends StatelessWidget {
  const _AuthWithIcons();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.images.icons.google.image(width: 32, height: 32),
        SizedBox(
          width: 32,
        ),
        Assets.images.icons.facebook.image(width: 32, height: 32),
        SizedBox(
          width: 32,
        ),
        Assets.images.icons.twitter.image(width: 32, height: 32),
      ],
    );
  }
}

class _ElavetedButtonLoginSignUp extends StatelessWidget {
  final String bottomLabel;
  const _ElavetedButtonLoginSignUp({
    required this.bottomLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 32, 0, 16),
      child: ElevatedButton(
          style: ButtonStyle(
            minimumSize: WidgetStatePropertyAll(
              Size(MediaQuery.of(context).size.width, 50),
            ),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24))),
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const MainScreen()));
          },
          child: Text(bottomLabel.toUpperCase())),
    );
  }
}

class _NormalTextField extends StatelessWidget {
  final String label;
  const _NormalTextField({
    required this.themeData,
    required this.label,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 1,
      style: Theme.of(context).textTheme.titleSmall,
      decoration: InputDecoration(
          label: Text(
        label,
        style: themeData.textTheme.bodyMedium!
            .copyWith(fontWeight: FontWeight.w700),
      )),
    );
  }
}

class _PasswordTextField extends StatefulWidget {
  const _PasswordTextField({
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  State<_PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<_PasswordTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      autocorrect: false,
      enableSuggestions: false,
      maxLines: 1,
      style: Theme.of(context).textTheme.titleSmall,
      decoration: InputDecoration(
        suffix: InkWell(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  obscureText?'Show':'Hide',
                  style: widget.themeData.textTheme.bodyMedium!
                      .copyWith(color: widget.themeData.colorScheme.primary),
                ),
              ],
            )),
        label: Text(
          'Password',
          style: widget.themeData.textTheme.bodyMedium!
              .copyWith(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
