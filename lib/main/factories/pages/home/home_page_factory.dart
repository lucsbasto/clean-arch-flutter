import 'package:amigo_fiel/main/factories/pages/home/sliding_up_factory.dart';
import 'package:amigo_fiel/presentation/presenters/presenters.dart';
import 'package:amigo_fiel/main/factories/presenters/presenters.dart';
import 'package:amigo_fiel/ui/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget makeHomePage() {
  final presenter = Get.put<GetxHomePresenter>(makeGetxHomePresenter());
  final panelPresender = Get.put<GetxPanelPresenter>(makeGetxPanelPresenter());

  final slidingUp = makeSlidingUp(panelPresender);

  return HomePage(
    presenter: presenter,
    slidingUp: slidingUp,
  );
}
