import 'package:amigo_fiel/main/factories/pages/pages.dart';
import 'package:amigo_fiel/ui/pages/maps/maps_page.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import '../utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return GetMaterialApp(
      title: "Amigo Fiel",
      debugShowCheckedModeBanner: false,
      theme: CustomThemeData.lightTheme,
      darkTheme: CustomThemeData.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: makeSplashPage),
        GetPage(name: '/login', page: makeLoginPage),
        GetPage(
            name: '/maps',
            page: () => Scaffold(
                  appBar: AppBar(
                    title: Text('Maps'),
                  ),
                  body: Text('Maps'),
                )),
      ],
    );
  }
}
