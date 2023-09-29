import 'package:amigo_fiel/main/factories/presenters/presenters.dart';
import 'package:amigo_fiel/presentation/presenters/presenters.dart';
import 'package:amigo_fiel/ui/pages/maps/maps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget makeMapsPage() {
  final presenter = Get.put<GetxMapPresenter>(makeGetxMapsPresenter());
  final panelPresenter = Get.put<GetxPanelPresenter>(makeGetxPanelPresenter());

  return MapsPage(
    presenter: presenter,
    panelPresenter: panelPresenter,
  );
}
