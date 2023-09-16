import 'package:amigo_fiel/main/factories/pages/login/login.dart';
import 'package:amigo_fiel/presentation/presenters/getx_login_presenter.dart';
import 'package:amigo_fiel/ui/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget makeLoginPage() {
  final presenter = Get.put<GetxLoginPresenter>(makeGetxLoginPresenter());
  return LoginPage(
    presenter: presenter,
  );
}
