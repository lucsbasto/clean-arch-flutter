import 'package:amigo_fiel/presentation/presenters/presenters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatelessWidget {
  final GetxMapPresenter presenter;
  final GetxPanelPresenter panelPresenter;
  const MapsPage({Key? key, required this.presenter, required this.panelPresenter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<GetxMapPresenter>(
        builder: (controller) {
          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: controller.currentPosition.value,
              zoom: 15,
            ),
            onCameraMove: (position) {
              controller.updatePosition(position.target);
            },
            markers: Set<Marker>.of(controller.markers),
            onTap: (position) {
              panelPresenter.closePanel();
            },
          );
        },
      ),
    );
  }
}
