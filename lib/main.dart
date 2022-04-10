import 'package:flutter/material.dart';
import 'package:theme/app_theme.dart';
import 'package:theme/colors_theme.dart';

void main() {
  runApp(const MyApp());
}

extension MyUIExt on BuildContext {
  TextTheme tt() => Theme.of(this).textTheme;
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  ThemeMode currentThemeMode = ThemeMode.light;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightv2,
      darkTheme: AppTheme.dark,
      themeMode: currentThemeMode,
      home: Home(onThemeChange: () {
        setState(() {
          if (currentThemeMode == ThemeMode.dark) {
            currentThemeMode = ThemeMode.light;
          } else {
            currentThemeMode = ThemeMode.dark;
          }
        });
      }),
    );
  }
}

class Home extends StatelessWidget {
  final Function onThemeChange;
  const Home({Key? key, required this.onThemeChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello world'),
      ),
      body: Center(
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green)),
            onPressed: () {
              onThemeChange();
            },
            child: Text(
              'Click Me',
              style: context.tt().headline1!.copyWith(color: AppColors.buttonColor),
            )),
      ),
    );
  }
}
