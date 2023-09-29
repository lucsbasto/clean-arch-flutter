import 'package:amigo_fiel/main/factories/presenters/presenters.dart';
import 'package:amigo_fiel/presentation/presenters/presenters.dart';
import 'package:get/get.dart';

GetxMapPresenter makeGetxMapsPresenter() {
  final panelPresenter = Get.put<GetxPanelPresenter>(makeGetxPanelPresenter());
  final feedspostPresenter = Get.put<GetxFeedspotPresenter>(makeGetxFeedspotPresenter());
  return GetxMapPresenter(
    feedspotPresenter: feedspostPresenter,
    panelPresenter: panelPresenter,
  );
}
