import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb/widgets/home_page.dart';
import 'package:provider/provider.dart';

import 'app_archtecture/controller/carousel_provider.dart';
import 'const/imdb_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MultiProvider(
           providers: [
             ChangeNotifierProvider(create: (context) => CarouselProvider()),
             //
             ChangeNotifierProvider(create: (context) => BottomNavigationProvider()),

           ],
            child:               MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'IMDB',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: ImdbColors.blueColor),
                useMaterial3: true,
              ),
              home: HomePage(),
            ),

          );
        });
  }
}

