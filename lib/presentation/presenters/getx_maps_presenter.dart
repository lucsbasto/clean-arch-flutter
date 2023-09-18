import 'package:amigo_fiel/presentation/presenters/presenters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:amigo_fiel/domain/entities/entities.dart';
import 'package:amigo_fiel/utils/utils.dart';

class GetxMapPresenter extends GetxController {
  final GetxFeedspotPresenter feedspotPresenter;
  final GetxPanelPresenter panelPresenter;

  Rx<LatLng> currentPosition = Rx<LatLng>(const LatLng(-10.277615138090594, -48.33330385386944));
  RxList<Marker> markers = <Marker>[].obs;
  BitmapDescriptor markerIconFull = BitmapDescriptor.defaultMarker;
  BitmapDescriptor markerIconEmpty = BitmapDescriptor.defaultMarker;

  GetxMapPresenter({required this.feedspotPresenter, required this.panelPresenter});

  @override
  void onInit() async {
    await addCustomMarker();
    getMarkers();
    super.onInit();
  }

  Future<void> addCustomMarker() async {
    markerIconFull = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), customMarkerFull);
    markerIconEmpty = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), customMarkerEmpty);
  }

  addMarker(LatLng position) {
    Marker? marker;
    marker = Marker(
      markerId: MarkerId(DateTime.now().toString()),
      position: position,
      icon: markerIconFull,
      onTap: () {
        panelPresenter.showPanel();
      },
    );
    markers.add(marker);
  }

  Future<void> getMarkers() async {
    try {
      await feedspotPresenter.getAll();
      final feedspots = feedspotPresenter.feedspots;
      final List<Marker> newMarkers = [];
      for (var feedspot in feedspots) {
        Marker marker = Marker(
          markerId: MarkerId(feedspot.id.toString()),
          position: LatLng(feedspot.latitude, feedspot.longitude),
          icon: feedspot.isFull ? markerIconFull : markerIconEmpty,
          onTap: () {
            feedspotPresenter.setFeedspot(feedspot);
            panelPresenter.openPanel();
          },
        );
        newMarkers.add(marker);
      }
      markers.assignAll(newMarkers);
    } catch (e) {
      print(e);
    }
  }

  void updateMarkerIcon() {
    FeedspotEntity? feedspot = feedspotPresenter.feedspot;
    if (feedspot == null) {
      return;
    }
    final MarkerId markerId = MarkerId(feedspot.id.toString());
    markers.removeWhere((marker) => marker.markerId == markerId);
    final Marker marker = Marker(
        markerId: markerId,
        position: LatLng(feedspot.latitude, feedspot.longitude),
        icon: markerIconFull,
        onTap: () {
          feedspotPresenter.setFeedspot(feedspot);
          panelPresenter.openPanel();
        });
    markers.add(marker);
  }

  void removeMarker(Marker marker) {
    markers.remove(marker);
  }

  void updatePosition(LatLng position) {
    currentPosition.value = position;
  }
}
