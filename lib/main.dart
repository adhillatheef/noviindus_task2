import 'package:flutter/material.dart';
import 'package:noviindus_task2/features/add_feed/provider/add_feed_provider.dart';
import 'package:noviindus_task2/features/auth/presentation/pages/login_screen.dart';
import 'package:noviindus_task2/features/auth/provider/login_screen_provider.dart';
import 'package:provider/provider.dart';

import 'common/themes/theme.dart';
import 'features/home/provider/home_screen_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginScreenProvider()),
        ChangeNotifierProvider(create: (context) => HomeScreenProvider()),
        ChangeNotifierProvider(create: (context) => AddFeedProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        home: LoginScreen(),
      ),
    );
  }
}
