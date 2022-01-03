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
      child: MaterialApp(
        title: 'Project Suva',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        scrollBehavior: const ScrollBehavior().copyWith(scrollbars: false),
        home: const ProgressBar(),
      ),
    );
  }
}
