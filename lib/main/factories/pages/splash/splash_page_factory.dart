import 'package:amigo_fiel/main/factories/pages/splash/splash_presenter_factory.dart';
import 'package:amigo_fiel/ui/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

Widget makeSplashPage() {
  return SplashPage(
    presenter: makeGetxSplashPresenter(),
  );
}
