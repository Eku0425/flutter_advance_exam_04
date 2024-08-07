import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screen/provider/news_provider.dart';
import 'Screen/view/ Components/Deatils_Screen/Deatils_Screen.dart';
import 'Screen/view/ Components/Home_Screen/Home_Screen.dart';
import 'Screen/view/ Components/Linked_news_page/Linked_news.dart';
import 'Screen/view/ Components/Splash_Screen/Splash_Screen.dart';

void main() {
  return runApp(
    NewsApp(),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Newsprovider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => Splashscreen(),
          '/home': (context) => Homepage(),
          '/detail': (context) => Detailpage(),
          '/save': (context) => Savedscreen(),
        },
      ),
    );
  }
}
