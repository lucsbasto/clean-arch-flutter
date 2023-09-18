import 'package:amigo_fiel/main/factories/presenters/presenters.dart';
import 'package:amigo_fiel/presentation/presenters/getx_maps_presenter.dart';

GetxMapPresenter makeGetxMapsPresenter() {
  return GetxMapPresenter(
    feedspotPresenter: makeGetxFeedspotPresenter(),
    panelPresenter: makeGetxPanelPresenter(),
  );
}
