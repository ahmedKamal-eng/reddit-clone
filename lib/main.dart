
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'VideoPlayerScreen/video_player_screen.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((value) {
    runApp(const MyApp());

  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Demo',
      // themeMode: ThemeMode.dark,
      theme: ThemeData.dark(),
      // darkTheme: ThemeData(
      //   colorScheme:ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   brightness: Brightness.dark
      // ),
      home:  VideoPlayerScreen(),
    );
  }
}

