import 'package:amigo_fiel/ui/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import '../../presenters/presenters.dart';

Widget makeSplashPage() {
  return SplashPage(
    presenter: makeGetxSplashPresenter(),
  );
}
