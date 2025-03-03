import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:video_streaming/app/utils/themes.dart';
import 'package:video_streaming/generated/locales.g.dart';

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      // themeMode: ThemeMode.dark,
      theme: Themes.theme(),
      darkTheme: Themes.darkTheme(),
      translationsKeys: AppTranslation.translations,
      locale: Locale("en", "US"),
      fallbackLocale: Locale("en", "US"),
    );
  }
}
