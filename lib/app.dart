import 'package:fancy_cursor/fancy_cursor.dart';
import 'package:flutter/material.dart';
import 'package:splash_tap/splash_tap.dart';
import 'package:suva/widgets/dock.dart';
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
        // scrollBehavior: const ScrollBehavior().copyWith(scrollbars: false),

        // home: const Home(),
        // home: Splash(
        //   onTap: () {},
        //   child: FancyCursor(
        //     child: const Home(),
        //     color: Colors.black,
        //     trailColor: Colors.black.withOpacity(0.2),
        //     size: 32.0,
        //     trailSize: 64,
        //     delay: const Duration(milliseconds: 1000),
        //     trailDelay: const Duration(milliseconds: 2500),
        //   ),
        // ),

        home: const Dock(),
      ),
    );
  }
}
