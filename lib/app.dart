import 'package:flutter/material.dart';
import 'package:suva/exports.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SectionProvider()),
      ],
      child: ThemeProvider(
        themes: [
          AppTheme.light(),
          AppTheme(
            id: 'knight',
            description: 'dark theme',
            data: ThemeData(
              scaffoldBackgroundColor: const Color(0xFF161616),
              colorScheme: const ColorScheme.dark(),
            ),
          ),
        ],
        child: ThemeConsumer(
          child: Builder(
            builder: (themeContext) {
              return MaterialApp(
                theme: ThemeProvider.themeOf(themeContext).data,
                title: 'Project Suva',
                home: const ProgressBar(),
                debugShowCheckedModeBanner: false,
                scrollBehavior:
                    const ScrollBehavior().copyWith(scrollbars: false),
              );
            },
          ),
        ),
      ),
    );
  }
}
