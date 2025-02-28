import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return GetMaterialApp(
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          bottomAppBarTheme: BottomAppBarTheme(
            shadowColor: Colors.red,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              enableFeedback: false,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white70,
              backgroundColor: Color(0xff111111)),
          textTheme: GoogleFonts.robotoTextTheme(),
        ),
        darkTheme: ThemeData(
          textTheme: GoogleFonts.robotoTextTheme(),
        ));
  }
}
