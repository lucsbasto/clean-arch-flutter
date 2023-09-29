import 'package:amigo_fiel/main/factories/presenters/feedspot_presenter.dart';
import 'package:amigo_fiel/main/factories/presenters/panel_presenter_factory.dart';
import 'package:amigo_fiel/presentation/presenters/getx_feedspot_presenter.dart';
import 'package:amigo_fiel/presentation/presenters/getx_panel_presenter.dart';
import 'package:amigo_fiel/ui/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget makePanel() {
  final panelPresenter = Get.put<GetxPanelPresenter>(makeGetxPanelPresenter());
  final feedspotPresender = Get.put<GetxFeedspotPresenter>(makeGetxFeedspotPresenter());
  return FeedSpotPanel(
    panelPresenter: panelPresenter,
    feedspotPresenter: feedspotPresender,
  );
}
