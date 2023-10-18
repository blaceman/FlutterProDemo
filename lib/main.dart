import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_demo/routers/index.dart';
import 'package:project_demo/services/index.dart';
import 'package:project_demo/string_res/index.dart';
import 'package:project_demo/theme.dart';
import 'package:project_demo/widgets/index.dart';

void main() {
  Get.put<GlobalService>(GlobalService());
  Get.put<HttpService>(HttpService());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return ScrollConfiguration(
            behavior: _NoShadowScrollBehavior(),
            child: child ??
                GetMaterialApp(
                  title: 'Flutter Demo',
                  debugShowCheckedModeBanner: false,
                  initialRoute: Routers.main,
                  getPages: Routers.getPages,
                  translations: LanguageRes(),
                  locale: const Locale('zh', 'CN'),
                  fallbackLocale: const Locale('en', 'US'),
                  // initialBinding: FirstControllerBinding(),
                  theme: ThemeData(colorSchemeSeed: AppTheme.primary),
                  builder: CustomToast.init(builder: (context, child) {
                    return ScrollConfiguration(
                      behavior: _NoShadowScrollBehavior(),
                      child: child ?? const Material(),
                    );
                  }),
                ));
      },
    );
  }
}

class _NoShadowScrollBehavior extends ScrollBehavior {
  //定义滚动行为
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return child;
      case TargetPlatform.android:
        return GlowingOverscrollIndicator(
          showLeading: false,
          showTrailing: false,
          axisDirection: details.direction,
          color: Theme.of(context).colorScheme.primary,
          child: child,
        );
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return GlowingOverscrollIndicator(
          showLeading: false,
          showTrailing: false,
          axisDirection: details.direction,
          color: Theme.of(context).colorScheme.primary,
          child: child,
        );
    }
  }
}
