import 'package:amigo_fiel/main/factories/pages/login/login.dart';
import 'package:amigo_fiel/ui/pages/login/login_page.dart';
import 'package:flutter/material.dart';

Widget makeLoginPage() {
  return LoginPage(
    presenter: makeLoginPresenter(),
  );
}
