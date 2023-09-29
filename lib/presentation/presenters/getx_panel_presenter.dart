import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class GetxPanelPresenter extends GetxController {
  PanelController controller = PanelController();
  final RxBool _isPanelVisible = true.obs;
  bool get isVisible => _isPanelVisible.value;

  void showPanel() {
    _isPanelVisible.value = true;
    controller.show();
  }

  void hidePanel() {
    _isPanelVisible.value = false;
    controller.hide();
  }

  void openPanel() {
    _isPanelVisible.value = true;
    controller.open();
  }

  void closePanel() {
    _isPanelVisible.value = false;
    controller.close();
  }
}
