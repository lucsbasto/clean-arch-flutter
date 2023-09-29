import 'package:amigo_fiel/main/factories/pages/home/panel_factory.dart';
import 'package:amigo_fiel/main/factories/pages/maps/maps.dart';
import 'package:amigo_fiel/main/factories/presenters/feedspot_presenter.dart';
import 'package:amigo_fiel/main/factories/presenters/panel_presenter_factory.dart';
import 'package:amigo_fiel/presentation/presenters/getx_feedspot_presenter.dart';
import 'package:amigo_fiel/presentation/presenters/getx_panel_presenter.dart';
import 'package:amigo_fiel/ui/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget makeSlidingUp(presenter) {
  final maps = makeMapsPage();
  final panel = makePanel();
  final panelPresenter = Get.put<GetxPanelPresenter>(makeGetxPanelPresenter());
  final feedspostPresenter = Get.put<GetxFeedspotPresenter>(makeGetxFeedspotPresenter());

  return FeedspotSlidingUp(
    mapsPage: maps,
    panel: panel,
    feedspotPresenter: feedspostPresenter,
    panelPresenter: panelPresenter,
  );
}
